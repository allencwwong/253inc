class NewSalesStructure < ActiveRecord::Migration
  def change
    remove_column :sales,:amount,:integer
    remove_column :sales,:order_type,:string
  end
end
