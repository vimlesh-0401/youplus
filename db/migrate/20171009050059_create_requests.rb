class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer  :customer_id
      t.datetime :request_at
      t.datetime :pickedup_at
      t.datetime :completed_at
      t.integer  :status
      t.integer  :request_id
      
      t.references :location
      t.references :driver
      t.timestamps
    end
  end
end
