class CreateOrderTypes < ActiveRecord::Migration
  def change
    create_table :order_types do |t|
      t.integer :sales_id
      t.string :order_type
      t.integer :amount
      t.timestamps null: false
    end
  end
end
