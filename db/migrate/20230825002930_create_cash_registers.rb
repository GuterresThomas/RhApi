class CreateCashRegisters < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_registers do |t|
      t.decimal :starting_balance
      t.decimal :ending_balance

      t.timestamps
    end
  end
end
