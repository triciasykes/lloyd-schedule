class WorkOrdersController < ApplicationController

    def index
      @work_orders = WorkOrder.all
      @technicians = Technician.all
     
      # @orders = orders
      respond_to do |format|
        format.html
        format.json { render json: @work_orders} 
      end
    end
    
    def new
      @work_order = WorkOrder.new
    end
  
    def show
    end
  
    def create
      @work_order = WorkOrder.new(work_order_params)
  
      respond_to do |format|
        if @work_order.save
           format.html { redirect_to @work_order, notice: 'work_order was successfully created.' }
           format.json { render :show, status: :created, location: @work_order }
        else
           format.html { render :new }
           format.json { render json: @work_order.errors, status: :unprocessable_entity }
        end
     end
    end
  
  #  def orders
  #   orders = WorkOrder.where('technician_id =?', params[:technician_id])
  #  end
  
  
  
    private
    def work_order_params
      params.require(:work_order).permit(:id, :technician_id, :location_id, :time, :duration, :price)
    end
  end
  
