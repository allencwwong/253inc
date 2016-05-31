class InventoriesController < ApplicationController
  def index 
    @inventory = Inventory.all
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @order_date = params[:order_date] 
    @progress = params[:progress] 
    @order_list = params[:order_list]
    @due_date = params[:due_date]
  
    @inventory = Inventory.create(order_date: @order_date, progress: @progress, order_list: @order_list, due_date: @due_date)
    if @inventory.save 
    redirect_to "/"
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

end
