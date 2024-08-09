class BookmarksController < ApplicationController
  def new
    @list = List.find(params['list_id'])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    Rails.logger.debug "List found: #{@list.inspect}"

    @bookmark = @list.bookmarks.find(params[:id])
    Rails.logger.debug "Bookmark found: #{@bookmark.inspect}"

    if @bookmark.destroy
      redirect_to list_path(@list), notice: 'Bookmark was successfully deleted.'
    else
      Rails.logger.debug "Failed to delete Bookmark: #{@bookmark.errors.full_messages}"
      redirect_to list_path(@list), alert: 'Failed to delete Bookmark.'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
