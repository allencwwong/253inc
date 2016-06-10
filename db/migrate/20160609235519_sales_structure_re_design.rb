class SalesStructureReDesign < ActiveRecord::Migration
  def change
    add_column :sales,:order_type,:string 
    add_column :sales,:amount,:integer
    remove_column :sales,:order_type_id,:integer
  end
end
