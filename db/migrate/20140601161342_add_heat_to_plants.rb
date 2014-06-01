class AddHeatToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :heat, :boolean, default: false
  end
end
