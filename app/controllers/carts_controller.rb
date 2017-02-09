class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.current_cart
      @cart = current_user.current_cart
    else
      @cart = Cart.find(params[:id])
    end
  end

  def checkout
    @cart = Cart.find(params[:id])

    @cart.line_items.each do |line_item|
      item = line_item.item
      item.inventory -= line_item.quantity
      item.save
    end

    @cart.submitted!
    current_user.current_cart = nil

    redirect_to cart_path(@cart)
  end
end

