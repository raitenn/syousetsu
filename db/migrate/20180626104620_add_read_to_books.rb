class AddReadToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :read, :integer
  end
end
