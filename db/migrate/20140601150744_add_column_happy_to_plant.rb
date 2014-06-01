class AddColumnHappyToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :happy, :boolean
  end
end
