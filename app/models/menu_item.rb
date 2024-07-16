class MenuItem < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items  # This will fetch orders associated with order items
    has_one_attached :image
end
  