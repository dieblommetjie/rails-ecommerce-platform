# frozen_string_literal: true

class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[update destroy]

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_path(@cart_item.cart), notice: 'Item added to cart.'
    else
      # Handle error
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_path(@cart_item.cart), notice: 'Cart item updated.'
    else
      # Handle error
    end
  end

  def destroy
    cart = @cart_item.cart
    @cart_item.destroy
    redirect_to cart_path(cart), notice: 'Item removed from cart.'
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :product_id, :quantity)
  end
end
