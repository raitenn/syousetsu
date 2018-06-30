class AddUserIdToImpression < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :user_id, :integer
  end
end
