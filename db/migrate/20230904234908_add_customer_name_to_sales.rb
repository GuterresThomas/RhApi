class AddCustomerNameToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :customer_name, :string
  end
end
