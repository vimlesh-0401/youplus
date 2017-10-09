class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.integer :longi
      t.integer :lati
      
      t.timestamps
    end
  end
end
