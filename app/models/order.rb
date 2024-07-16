class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, inverse_of: :order
  accepts_nested_attributes_for :order_items, reject_if: :all_blank, allow_destroy: true


  has_many :menu_items, through: :order_items  # This establishes a many-to-many relationship through order_items



  validates :table_number, presence: true

  after_create :update_total_amount_if_order_items_changed

  def update_total_amount_if_order_items_changed
    # Check if there are any associated order items
    if order_items.any?
      update(total_amount: calculate_total_amount)
    end
  end

  def calculate_total_amount
    menu_items.sum(:price)
  end
end
