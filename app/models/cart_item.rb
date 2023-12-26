# frozen_string_literal: true

class CartItem < ApplicationRecord
  # Associations
  belongs_to :cart
  belongs_to :product

  # Validations
  validates :quantity, numericality: { greater_than: 0 }

  # Custom methods
  def total_price
    product.price * quantity
  end

  # Additional custom logic as needed
end
