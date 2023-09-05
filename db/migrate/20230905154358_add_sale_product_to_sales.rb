class AddSaleProductToSales < ActiveRecord::Migration[7.0]
  def change
    add_column :sales, :sale_product, :string
  end
end
