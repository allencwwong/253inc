class RemoveSaleNoAndQuoteNo < ActiveRecord::Migration
  def change
    remove_column :sales, :quote_number,:string
    remove_column :sales, :sale_number, :string
  end
end
