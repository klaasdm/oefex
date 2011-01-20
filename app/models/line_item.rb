class LineItem < ActiveRecord::Base
  belongs_to :show_room
  belongs_to :cart
  belongs_to :order


  def total_price
  show_room.price * quantity
  end


end
