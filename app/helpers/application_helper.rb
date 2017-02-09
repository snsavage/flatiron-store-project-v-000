module ApplicationHelper
  def display_currency(number)
    number_to_currency(number.to_f/100)
  end
end
