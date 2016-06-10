class SalesController < ApplicationController
  def index
    puts params[:other_param]

    today_day = Date.today.wday
    today_week_start = Date.today-today_day
    today_week_end = today_week_start + 6

    def sale_amount_sum(orderType,date,wStart,wEnd)
      amount = 0
      
      if wStart === nil
        @sales = Sale.where("date in (?)",Date.today)
      elsif wStart
        @sales = Sale.where("date in (?)", wStart..wEnd)
      end

      @sales.each do |sale|
        if(sale.order_type === orderType)
          amount+= sale.amount
        end
      end
      
      return amount
    end


    @daily_sales_amount = sale_amount_sum("sales",Date.today,nil,nil)
    @daily_quotes_amount = sale_amount_sum("quote",Date.today,nil,nil)
    @weekly_sales_amount = sale_amount_sum("sales",Time.now.wday,today_week_start,today_week_end)
    @weekly_quotes_amount = sale_amount_sum("quote",Time.now.wday,today_week_start,today_week_end)

    def sort_displayer(view,orderType)
      today_day = Date.today.wday
      today_week_start = Date.today-today_day
      today_week_end = today_week_start + 6
      
      if view === "all" || view === "" && orderType === "all" || orderType === ""
        @sales = Sale.all
      elsif view === "today" && orderType === "all" || orderType === ""
        @sales = Sale.where("date in (?)" , Date.today)  
      elsif view === "today" && orderType === "sales"
        @sales = Sale.where("date in (?) and order_type =?" , Date.today, orderType)
      elsif view === "weekly" && orderType === "sales"
        @sales = Sale.where("date in (?) and order_type =?" , today_week_start..today_week_end , orderType)
      elsif view === "today" && orderType === "quotes"
        @sales = Sale.where("date in (?) and order_type =?" , Date.today, "quote") 
      elsif view === "weekly" && orderType === "quotes"
        @sales = Sale.where("date in (?) and order_type =?" , today_week_start..today_week_end, "quote")
      elsif view === "monthly" && orderType === "sales"
        @sales = Sale.where("extract(month from date) = ? and order_type =?",Time.now.month,"sales") 
      elsif view === "monthly" && orderType === "quotes"
        @sales = Sale.where("extract(month from date) = ? and order_type =?",Time.now.month,"quote")
      end
    end

    sort_displayer(params[:view],params[:order_type])

    # if(params[:view] === "all" || "")
    #    @sales = Sale.all
    # end

    # if(params[:view] === "today")
    #    @sales = Sale.where("date in (?)", Date.today)
    # end

    # if(params[:view] === "weekly")
    #     @sales = Sale.where("date in (?)", today_week_start..today_week_end)
    # end

    # if(params[:view] === "monthly")
    #   @sales = Sale.where("extract(month from date) = ?",Time.now.month)
    # end


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

  def store_params

  end



end
