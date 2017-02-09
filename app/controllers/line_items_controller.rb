class LineItemsController < ApplicationController
  def create
    if cart = current_user.current_cart
      line_item = cart.add_item(params[:item_id])
      line_item.save
      cart.save
    else
      cart = Cart.new
      line_item = cart.add_item(params[:item_id])
      line_item.save
      cart.save
      current_user.current_cart = cart
    end

    redirect_to cart_path(cart)
  end
end
