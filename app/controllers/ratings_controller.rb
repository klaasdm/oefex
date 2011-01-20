
class RatingsController < ApplicationController

before_filter :authenticate_user!
def create
@show_room = ShowRoom.find_by_id(params[:show_room_id])
if current_user.id == @show_room.user_id
redirect_to show_room_path(@show_room), :alert => "You cannot rate
for your own photo"
else
@rating = Rating.new(params[:rating])
@rating.show_room_id = @show_room.id
@rating.user_id = current_user.id
if @rating.save
respond_to do |format|
format.html { redirect_to show_room_path(@show_room), :notice => "Your rating has been saved" }
format.js
end
end
end
end
def update
@show_room = ShowRoom.find_by_id(params[:show_room_id])
if current_user.id == @show_room.user_id
redirect_to show_room_path(@show_room), :notice => "You cannot rate
for your own photo"
else
@rating = current_user.ratings.find_by_show_room_id(@show_room.id)
if @rating.update_attributes(params[:rating])
respond_to do |format|
format.html { redirect_to show_room_path(@show_room), :notice => "Your rating has been updated" }
format.js
end
end
end
end
end