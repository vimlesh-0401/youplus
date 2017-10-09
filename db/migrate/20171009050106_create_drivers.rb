class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.integer :driver
      t.boolean :available
      t.timestamps
    end
  end
end
