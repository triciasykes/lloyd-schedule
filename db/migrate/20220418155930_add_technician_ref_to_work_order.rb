class AddTechnicianRefToWorkOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_orders, :technician, foreign_key: true

  end
end
