class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :sale, null: false, foreign_key: true
      t.string :payment_method
      t.decimal :amount

      t.timestamps
    end
  end
end
