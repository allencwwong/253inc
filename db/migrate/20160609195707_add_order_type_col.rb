class AddOrderTypeCol < ActiveRecord::Migration
  def change
    add_column :sales,:order_type,:string
  end
end
