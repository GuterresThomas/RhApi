class Product < ApplicationRecord
    belongs_to :product_category
    has_many :sale_items
end
