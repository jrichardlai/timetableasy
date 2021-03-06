class RoomsController < ApplicationController
  # GET /room
  # GET /room.xml
  before_filter :login_required
  before_filter :set_campus

  def index
    params[:footnotes] = "false"
    @rooms = @campus.rooms.all

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @rooms }
    end
  end

  # GET /room/new
  # GET /room/new.xml
  def new
    params[:footnotes] = "false"
    @room = @campus.rooms.build

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @rooms }
    end
  end

  # GET /room/1/edit
  def edit
    params[:footnotes] = "false"
    @room = Room.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /room
  # POST /room.xml
  def create
    @room = @campus.rooms.build(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to(campus_rooms_path(@campus)) }
        format.xml  { render :xml => @room, :status => :created, :location => @room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /room/1
  # PUT /room/1.xml
  def update
    @room = @campus.rooms.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to(campus_rooms_path(@campus)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /room/1
  # DELETE /room/1.xml
  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to(campus_rooms_path(@campus)) }
      format.xml  { head :ok }
    end
  end

  def set_campus
    @campus = Campus.find(params[:campus_id])
  end

end
