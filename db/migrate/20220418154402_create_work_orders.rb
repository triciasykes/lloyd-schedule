class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.datetime :time
      t.integer :duration
      t.integer :price

      t.timestamps
    end
  end
end
