# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: %i[show update destroy]

  def show
    @cart_items = @cart.cart_items
  end

  def update
    # Logic to update the cart (e.g., applying discounts)
    redirect_to cart_path(@cart), notice: 'Cart updated successfully.'
  end

  def destroy
    @cart.destroy
    redirect_to store_path, notice: 'Cart emptied successfully.'
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  # Additional private methods as needed
end
