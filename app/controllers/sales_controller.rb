class SalesController < ApplicationController
  
  def index
    
    @sales = Sale.all
    @sale_today = 0;
    @sales.each do |sale|
      puts Date.parse(sale.date.to_s).to_s
      puts DateTime.now.strftime("%Y-%m-%d").to_s
      
      if Date.parse(sale.date.to_s).to_s === DateTime.now.strftime("%Y-%m-%d").to_s
        @sale_today+= sale.amount
      end
    end

  end

  def new
  end

  def create
    @date = params[:date] 
    @sale_no = params[:sale_no]
    @by = params[:by] 
    @customer = params[:customer]
    @amount = params[:amount]
    @quote_no = params[:quote_no]
    @q_amount = params[:q_amount]
    @p_type = params[:p_type]
    @due_date = params[:due_date]
    @note = params[:note]
  
    @sale = Sale.create(date: @date, sale_number: @sale_no, by: @by, customer: @customer, amount: @amount, quote_number: @quote_no, product_type: @p_type, due_date: @due_date, note: @note)
    
    if @sale.save 
    redirect_to "/sales"
      else
        render :new
    end
  
  end



end
