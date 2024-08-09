class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      Rails.logger.debug "Params: #{params.inspect}"
      movie_ids = params[:list][:movie_ids].reject(&:blank?) rescue []
      movie_ids.each do |movie_id|
        Bookmark.create(list: @list, movie_id: movie_id)
      end

      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, movie_id: [])
  end
end
