# frozen_string_literal: true

class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_items, dependent: :destroy

  # Validations
  validates :order_date, presence: true
  validates :status, presence: true

  # Custom methods
  def total_price
    order_items.sum { |item| item.quantity * item.product.price }
  end

  # Additional methods as needed
end
