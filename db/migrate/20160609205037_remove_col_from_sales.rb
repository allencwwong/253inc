class RemoveColFromSales < ActiveRecord::Migration
  def change
    remove_column :order_types,:sales_id,:integer
    add_column :sales,:order_type_id,:integer
  end
end
