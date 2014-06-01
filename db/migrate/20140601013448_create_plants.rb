class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :nickname
      t.date :planted_at

      t.timestamps
    end
  end
end
