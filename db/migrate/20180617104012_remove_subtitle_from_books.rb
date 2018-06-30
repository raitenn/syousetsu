class RemoveSubtitleFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :subtitle, :string
  end
end
