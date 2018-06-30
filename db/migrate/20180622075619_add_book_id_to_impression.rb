class AddBookIdToImpression < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :book_id, :integer
  end
end
