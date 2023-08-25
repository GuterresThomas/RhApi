class CreateSalesReports < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_reports do |t|
      t.date :report_date
      t.decimal :total_sales
      t.integer :transaction_count

      t.timestamps
    end
  end
end
