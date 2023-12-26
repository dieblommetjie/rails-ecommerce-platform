# frozen_string_literal: true

class OrderItem < ApplicationRecord
  # Associations
  belongs_to :order
  belongs_to :product

  # Validations
  validates :quantity, numericality: { greater_than: 0 }
  validate :product_present
  validate :order_present

  # Before Save Callback
  before_save :finalize

  # Instance Methods

  def unit_price
    # Price at the time of order, if product price changes later
    persisted? ? self[:unit_price] : product.price
  end

  def total_price
    unit_price * quantity
  end

  private

  def product_present
    errors.add(:product, 'is not valid or is not active.') if product.nil?
  end

  def order_present
    errors.add(:order, 'is not a valid order.') if order.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end
end
