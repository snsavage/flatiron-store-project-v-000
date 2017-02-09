module ApplicationHelper
  def display_currency(number)
    number_to_currency(number.to_f/100)
  end

  def current_cart
    current_user.current_cart if current_user
  end

  def current_cart?
    !!current_cart
  end
end
