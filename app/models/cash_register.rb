class CashRegister < ApplicationRecord
    has_many :transactions, class_name: 'TransactionHistory'
end
