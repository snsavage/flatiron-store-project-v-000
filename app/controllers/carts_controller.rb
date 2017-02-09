class CartsController < ApplicationController
  def show
  end

  def checkout
    @cart = Cart.find(params[:id])

    @cart.line_items.each do |line_item|
      item = line_item.item
      item.inventory -= line_item.quantity
      item.save
    end

    current_user.current_cart = nil
    binding.pry

    redirect_to cart_path(@cart)
  end
end
