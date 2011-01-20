class ShowoffController < ApplicationController

before_filter :authenticate_user!
  def index
 
      @show_rooms = ShowRoom.all
      @cart = current_cart
   
       end
  end

 
