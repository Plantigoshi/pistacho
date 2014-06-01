class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string :name
      t.float :measure
      t.string :type

      t.timestamps
    end
    add_index :metrics, :type
  end
end
