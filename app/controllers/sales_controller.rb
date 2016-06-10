class SalesController < ApplicationController
  puts Time.now.month
  def index
    
    @sales = Sale.all
    @sale_today = 0;
    @quote_today = 0;

    today_day = Date.today.wday
    today_week_start = Date.today-today_day
    today_week_end = today_week_start + 6


    if(params[:view] === "today")
       @sales = Sale.where("date in (?)", Date.today)
    end

    if(params[:view] === "weekly")
        @sales = Sale.where("date in (?)", today_week_start..today_week_end)
    end

    if(params[:view] === "monthly")
      @sales = Sale.where("extract(month from date) = ?",Time.now.month)
    end

    @sales.each do |sale|
      
      if Date.parse(sale.date.to_s).to_s === DateTime.now.strftime("%Y-%m-%d").to_s && sale.order_type === "sales"
          @sale_today+= sale.amount
      end

      if Date.parse(sale.date.to_s).to_s === DateTime.now.strftime("%Y-%m-%d").to_s && sale.order_type === "quote"
        @quote_today+= sale.amount
      end    
      
    end

  end #end of index

  def new
  end

  def create
    @date = params[:date] 
    @by = params[:by] 
    @customer = params[:customer]
    @p_type = params[:p_type]
    @due_date = params[:due_date]
    @note = params[:note]
    
    @order_type = params[:order_type]
    @amount = params[:amount]
  

    @sale = Sale.create(date: @date, by: @by, customer: @customer, product_type: @p_type, due_date: @due_date, note: @note, order_type: @order_type,amount: @amount)


    if @sale.save 
      redirect_to "/sales"
      else
        render :new
    end
  
  end



end
