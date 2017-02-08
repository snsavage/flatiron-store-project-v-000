class Cart < ActiveRecord::Base
  belongs_to :user

  has_many :line_items
  has_many :items, through: :line_items

  def total
    self.line_items.
      joins(:item).
      sum("items.price * line_items.quantity")
  end

  def add_item(new_item)
    if line_item = self.line_items.where(id: new_item).first
      line_item.quantity += 1
      line_item
    else
      self.line_items.build(item_id: new_item)
    end
  end
end
