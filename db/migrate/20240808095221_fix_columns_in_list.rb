class FixColumnsInList < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :movie_id, :integer
  end
end
