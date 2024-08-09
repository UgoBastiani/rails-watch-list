class FixColumnsInMovie < ActiveRecord::Migration[7.1]
  def change
    rename_column :movies, :url_img, :poster_url
  end
end
