class Cart < ActiveRecord::Base

has_many :line_items, :dependent => :destroy
def add_show_room(show_room_id)
  current_item = line_items.find_by_show_room_id(show_room_id)

  if current_item
  current_item.quantity += 1
  else
  current_item = line_items.build(:show_room_id => show_room_id)

  end
  current_item

end
def total_price
line_items.to_a.sum { |item| item.total_price }
end
def total_items
line_items.sum(:quantity)
end

end
