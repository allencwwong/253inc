class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.datetime :date
      t.integer :sale_number
      t.string :by
      t.string :customer
      t.integer :amount
      t.string :quote_number
      t.string :product_type
      t.datetime :due_date
      t.string :payment
      t.text :note

      t.timestamps null: false
    end
  end
end
