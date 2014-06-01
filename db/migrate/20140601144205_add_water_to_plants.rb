class AddWaterToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :water, :boolean, default: false
  end
end
