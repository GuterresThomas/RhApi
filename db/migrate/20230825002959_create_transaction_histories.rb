class CreateTransactionHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_histories do |t|
      t.string :event_type
      t.text :description
      t.datetime :timestamp

      t.timestamps
    end
  end
end
