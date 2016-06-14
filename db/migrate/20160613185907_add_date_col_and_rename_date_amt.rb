class AddDateColAndRenameDateAmt < ActiveRecord::Migration
  def change
    add_column :sales,:sale_date,:datetime
    add_column :sales,:sale_amount,:integer
    rename_column :sales,:date,:quote_date
    rename_column :sales,:amount,:quote_amount
  end
end
