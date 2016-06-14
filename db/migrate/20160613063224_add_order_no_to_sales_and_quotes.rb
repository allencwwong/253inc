class AddOrderNoToSalesAndQuotes < ActiveRecord::Migration
  def change
    add_column :sales,:sale_number,:string
    add_column :sales,:quote_number,:string
  end
end
