class AddImpressionToImpressions < ActiveRecord::Migration[5.2]
  def change
    add_column :impressions, :impression, :string
  end
end
