class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  @total_sales = Sale.where("order_type =?","sales").count()
  protect_from_forgery with: :exception



end
