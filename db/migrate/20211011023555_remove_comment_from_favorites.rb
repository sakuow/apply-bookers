class RemoveCommentFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :comment, :text
  end
end
