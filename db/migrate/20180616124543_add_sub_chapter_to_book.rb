class AddSubChapterToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :subchapter, :string
  end
end
