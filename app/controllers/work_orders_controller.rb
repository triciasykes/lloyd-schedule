class WorkOrdersController < ApplicationController

    def index 
        @work_orders = WorkOrder.all
        @technicians = Technician.all

        respond_to do |format|
          format.html
          format.json { render json: @work_orders} 
        end
    end

end
