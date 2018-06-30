class RemoveChapterFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :subChapter, :string
  end
end
