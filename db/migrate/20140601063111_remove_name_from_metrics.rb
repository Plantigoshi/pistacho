class RemoveNameFromMetrics < ActiveRecord::Migration
  def change
    remove_column :metrics, :name
    add_column :metrics, :plant_id, :integer
  end
end
