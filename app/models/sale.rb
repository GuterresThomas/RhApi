class Sale < ApplicationRecord
  belongs_to :customer
  has_many :sale_items
  has_one :payment
end
