class AddLocationRefToWorkOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_orders, :location, foreign_key: true
  end
end
