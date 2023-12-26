# frozen_string_literal: true

class Cart < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  # Methods

  # Calculate the total price of all items in the cart
  def total_price
    cart_items.sum(&:total_price)
  end

  # Add a product to the cart
  def add_product(product_id)
    current_item = cart_items.find_by(product_id:)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.build(product_id:)
    end
    current_item
  end
end
