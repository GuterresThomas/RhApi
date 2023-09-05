class AddPaymentMethodToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :payment_method, :string
  end
end
