class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.text :contact_info
      t.string :cpf

      t.timestamps
    end
  end
end
