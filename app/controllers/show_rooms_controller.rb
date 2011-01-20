class ShowRoomsController < ApplicationController


before_filter :authenticate_user!
   # GET /show_rooms
  # GET /show_rooms.xml
  def index
    @show_rooms = ShowRoom.find(:all,:conditions => {:user_id => current_user.id},:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @show_rooms }
    end
  end

  # GET /show_rooms/1
  # GET /show_rooms/1.xml
  def show
    @show_room = ShowRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @show_room }
    end
  end

  # GET /show_rooms/new
  # GET /show_rooms/new.xml
  def new
    @show_room = ShowRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @show_room }
    end
  end

  # GET /show_rooms/1/edit
  def edit
    @show_room = ShowRoom.find(params[:id])
  end

  # POST /show_rooms
  # POST /show_rooms.xml
  def create

    @show_room = ShowRoom.new(params[:show_room])
    @show_room.user_id = current_user.id
    @show_room.user.username = current_user.username

    respond_to do |format|
      if @show_room.save
        format.html { redirect_to(@show_room, :notice => 'Show room was successfully created.') }
        format.xml  { render :xml => @show_room, :status => :created, :location => @show_room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @show_room.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # PUT /show_rooms/1
  # PUT /show_rooms/1.xml
  def update
    @show_room = ShowRoom.find(params[:id])

    respond_to do |format|
      if @show_room.update_attributes(params[:show_room])
        format.html { redirect_to(@show_room, :notice => 'Show room was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @show_room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /show_rooms/1
  # DELETE /show_rooms/1.xml
  def destroy
    @show_room = ShowRoom.find(params[:id])
    @show_room.destroy

    respond_to do |format|
      format.html { redirect_to(show_rooms_url) }
      format.xml  { head :ok }
    end
  end
end
