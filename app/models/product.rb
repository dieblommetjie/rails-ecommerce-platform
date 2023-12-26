# frozen_string_literal: true

class Product < ApplicationRecord
  # Associations
  belongs_to :category, optional: true
  has_many :order_items

  # Validations
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scopes
  scope :active, -> { where(active: true) }
  scope :in_stock, -> { where('stock > ?', 0) }

  # Instance methods

  # Checks if the product is out of stock
  def out_of_stock?
    stock <= 0
  end

  # Reduce the stock of a product
  def reduce_stock(quantity)
    update(stock: stock - quantity) if stock >= quantity
  end

  # Additional methods as required
end
