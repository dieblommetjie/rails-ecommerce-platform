# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[show edit update destroy]

  def index
    @order_items = OrderItem.all
  end

  def show; end

  def new
    @order_item = OrderItem.new
  end

  def edit; end

  def create
    @order_item = OrderItem.new(order_item_params)
    if @order_item.save
      # Additional logic after successful creation
      redirect_to @order_item, notice: 'Order item was successfully created.'
    else
      render :new
    end
  end

  def update
    if @order_item.update(order_item_params)
      # Additional logic after successful update
      redirect_to @order_item, notice: 'Order item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_items_url, notice: 'Order item was successfully destroyed.'
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:order_id, :product_id, :quantity)
  end
end
