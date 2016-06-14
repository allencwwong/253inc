class QuotesController < ApplicationController
  def index
    @total_quotes = Sale.where("order_type =?","quote").count()
    @total_sales = Sale.where("order_type =?","sales").count()

    today_day = Date.today.wday
    today_week_start = Date.today-today_day
    today_week_end = today_week_start + 6

    def sale_amount_sum(orderType,date,wStart,wEnd)
      sale_amount = 0
      quote_amount = 0

      if wStart === nil
        @sales = Sale.where("quote_date in (?)",Date.today)
      elsif wStart
        @sales = Sale.where("quote_date in (?)", wStart..wEnd)
      end

      @sales.each do |sale|
        if(sale.order_type  === "sales")
          sale_amount+= sale.sale_amount
        end

        if(sale.order_type === "quote")
          quote_amount+= sale.quote_amount  
        end
      end
      
      if(orderType === "sales")
        return sale_amount
      else
        return quote_amount
      end
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
        @sales = Sale.where("quote_date in (?) and order_type =?"  , Date.today,"quote")  
      elsif view == "weekly" && orderType === "quote" 
        @sales = Sale.where("quote_date in (?) and order_type =?", today_week_start..today_week_end,"sales")
      elsif view == "monthly"  && orderType === "quote"
        @sales = Sale.where("extract(month from quote_date) = ? and order_type =?" ,Time.now.month,"quote") 

      end
    end

    sort_displayer(params[:view],params[:order_type])

  end

  def new                  
    @total_quotes = Sale.where("order_type =?","quote").count()
    @total_sales = Sale.where("order_type =?","sales").count()

    @product_type = [
      ['TK6','TK6'],
      ['UT10','UT10'],
      ['TK8','TK8'],
      ['ORBUS','ORBUS'],
    ]

    @states = [
      ['Alabama','AL'],
      ['Alaska','AK'],
      ['Arizona','AZ'],
      ['Arkansas','AR'],
      ['California','CA'],
      ['Colorado','CO'],
      ['Connecticut','CT'],
      ['Delaware','DE'],
      ['Washington DC','DC'],
      ['Florida','FL'],
      ['Georgia','GA'],
      ['Hawaii','HI'],
      ['Idaho','ID'],
      ['Illinois','IL'],
      ['Indiana','IN'],
      ['Iowa','IA'],
      ['Kansas','KS'],
      ['Kentucky','KY'],
      ['Louisiana','LA'],
      ['Maine','ME'],
      ['Maryland','MD'],
      ['Massachusetts','MA'],
      ['Michigan','MI'],
      ['Minnesota','MN'],
      ['Mississippi','MS'],
      ['Missouri','MO'],
      ['Montana','MT'],
      ['Nebraska','NE'],
      ['Nevada','NV'],
      ['New Hampshire','NH'],
      ['New Jersey','NJ'],
      ['New Mexico','NM'],
      ['New York','NY'],
      ['North Carolina','NC'],
      ['North Dakota','ND'],
      ['Ohio','OH'],
      ['Oklahoma','OK'],
      ['Oregon','OR'],
      ['Pennsylvania','PA'],
      ['Puerto Rico','PR'],
      ['Rhode Island','RI'],
      ['South Carolina','SC'],
      ['South Dakota','SD'],
      ['Tennessee','TN'],
      ['Texas','TX'],
      ['Utah','UT'],
      ['Vermont','VT'],
      ['Virgin Islands','VI'],
      ['Virginia','VA'],
      ['Washington','WA'],
      ['West Virginia','WV'],
      ['Wisconsin','WI'],
      ['Wyoming','WY']
    ]
  end

  def create
    @date = params[:date] 
    @quote_number = params[:quote_number]
    @product_type = params[:product_type]
    @amount = params[:amount]
        if current_user.email === "allencwwong@gmail.com" || current_user.email === "acw@253inc.com"
      @by = "ACW"
    elsif current_user.email === "m@253inc.com"
      @by = "MJC"
    elsif current_user.email === "abf@253inc.com"
      @by = "ABF"
    end
     
    @customer = params[:customer]
    @address = params[:address]
    @state = params[:states]
    @zip = params[:zip]

    

    def convert_to_datetime (date)
      date = date.split("")
      date[0] = date[0].concat(date[1]).to_i
      date.delete_at(1)
      date[1] = "-"
      date[2] = date[2].concat(date[3]).to_i
      date[4] = "-"
      date.delete_at(3)
      date.insert(0, date.delete_at(2))
      date.insert(2, date.delete_at(1))

      # [10][-][28][-][2][0][1][6]
      # [28][-][10][-][2][0][1][6]

      return date.join("")
    end
    
    
    # @due_date = convert_to_datetime(params[:due_date])

    @note = params[:note]
    
    @order_type = params[:order_type]
  

    @sale = Sale.create(quote_date: @date,quote_number: @quote_number, by: @by, customer: @customer, product_type: @product_type,address: @address,state: @state,zip: @zip, due_date: @due_date, note: @note, quote_amount: @amount, order_type: "quote")


    if @sale.save 
      redirect_to "/quotes?order_type=quotes&view=all"
      else
        render :new
    end
  
  end

  def edit
    @total_quotes = Sale.where("order_type =?","quote").count()
    @total_sales = Sale.where("order_type =?","sales").count()

    @product_type = [
      ['TK6','TK6'],
      ['UT10','UT10'],
      ['TK8','TK8'],
      ['ORBUS','ORBUS'],
    ]

    @states = [
      ['Alabama','AL'],
      ['Alaska','AK'],
      ['Arizona','AZ'],
      ['Arkansas','AR'],
      ['California','CA'],
      ['Colorado','CO'],
      ['Connecticut','CT'],
      ['Delaware','DE'],
      ['Washington DC','DC'],
      ['Florida','FL'],
      ['Georgia','GA'],
      ['Hawaii','HI'],
      ['Idaho','ID'],
      ['Illinois','IL'],
      ['Indiana','IN'],
      ['Iowa','IA'],
      ['Kansas','KS'],
      ['Kentucky','KY'],
      ['Louisiana','LA'],
      ['Maine','ME'],
      ['Maryland','MD'],
      ['Massachusetts','MA'],
      ['Michigan','MI'],
      ['Minnesota','MN'],
      ['Mississippi','MS'],
      ['Missouri','MO'],
      ['Montana','MT'],
      ['Nebraska','NE'],
      ['Nevada','NV'],
      ['New Hampshire','NH'],
      ['New Jersey','NJ'],
      ['New Mexico','NM'],
      ['New York','NY'],
      ['North Carolina','NC'],
      ['North Dakota','ND'],
      ['Ohio','OH'],
      ['Oklahoma','OK'],
      ['Oregon','OR'],
      ['Pennsylvania','PA'],
      ['Puerto Rico','PR'],
      ['Rhode Island','RI'],
      ['South Carolina','SC'],
      ['South Dakota','SD'],
      ['Tennessee','TN'],
      ['Texas','TX'],
      ['Utah','UT'],
      ['Vermont','VT'],
      ['Virgin Islands','VI'],
      ['Virginia','VA'],
      ['Washington','WA'],
      ['West Virginia','WV'],
      ['Wisconsin','WI'],
      ['Wyoming','WY']
    ]

    @payment_type = [
      ['Visa','visa'],
      ['Master','master'],
      ['American Express','amex'],
      ['Discover','discover']
    ]

    @sale = Sale.find(params[:id])
    @status = params[:status]
  end

  def update
    @sale_date = params[:sale_date]
    @sale_amount = params[:sale_amount]
    @payment_type = params[:payment_type]

    Sale.find(params[:id]).update( order_type:'sales',sale_date: @sale_date,sale_amount: @sale_amount,payment: @payment_type )
    redirect_to '/sales'
  end

  def change_status
  end




















end
