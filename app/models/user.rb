# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules (if using Devise for authentication)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Callbacks
  after_create :create_user_cart

  # Instance methods

  # Method to create a cart for the user after signing up
  private

  def create_user_cart
    Cart.create(user: self)
  end
end
