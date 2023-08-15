class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :birthdate
      t.string :gender
      t.string :marital_status
      t.string :cpf
      
      t.string :address
      t.string :phone
      t.string :email
      
      t.string :position
      t.string :department
      t.date :hire_date
      t.decimal :salary

      t.timestamps
    end
  end
end
