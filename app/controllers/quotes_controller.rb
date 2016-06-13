class QuotesController < ApplicationController
  def index
    @total_quotes = Sale.where("order_type =?","quote").count()
    @total_sales = Sale.where("order_type =?","sales").count()

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
      
      if view === "all" || view === "" && orderType === "quote"
        @sales = Sale.where("order_type =?","quote")
      elsif view === "today" && orderType === "quote" 
        @sales = Sale.where("date in (?) and order_type =?"  , Date.today,"quote")  
      elsif view == "weekly" && orderType === "quote" 
        @sales = Sale.where("date in (?) and order_type =?", today_week_start..today_week_end,"sales")
      elsif view == "monthly"  && orderType === "quote"
        @sales = Sale.where("extract(month from date) = ? and order_type =?" ,Time.now.month,"quote") 

      end
    end

    sort_displayer(params[:view],params[:order_type])

  end

  def change_status
  
 
    Sale.where( id:params[:sale_id]  ).update_all( order_type:'sales' )
    redirect_to '/sales'
  end




















end
