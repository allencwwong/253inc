class AddAddressStateZip < ActiveRecord::Migration
  def change
    add_column :sales,:address,:string
    add_column :sales,:state,:string
    add_column :sales,:zip,:string
  end
end
