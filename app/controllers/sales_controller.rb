class SalesController < ApplicationController
  
  def index
    
    @sales = Sale.all
    @sale_today = 0;
    @quote_today = 0;

    # User.find(:all, :conditions => { :country => 'canada' })
    if(params[:view] === "today")
       @sales = Sale.where(:date => Date.today)
    end

    if(params[:view] === "weekly")
        @sales = Sale.where(:date => Date.today-1..Date.today)
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
