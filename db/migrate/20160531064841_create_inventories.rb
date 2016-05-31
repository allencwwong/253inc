class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.datetime :order_date
      t.integer :progress
      t.text :order_list
      t.datetime :due_date
      t.datetime :time_elasped

      t.timestamps null: false
    end
  end
end
