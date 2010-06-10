class CampusesController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource
  # GET /campuses
  # GET /campuses.xml
  def index
    if current_user.manager?
      @campuses = current_user.campuses
    else
      @campuses = Campus.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campuses }
    end
  end

  # GET /campuses/1
  # GET /campuses/1.xml
  def show
    @rooms = @campus.rooms.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campus }
    end
  end
  
  def quick_look
    respond_to do |format|
      format.html { render :layout => false }
      format.xml
    end
  end

  # GET /campuses/new
  # GET /campuses/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campus }
    end
  end

  # GET /campuses/1/edit
  def edit
  end

  # POST /campuses
  # POST /campuses.xml
  def create
    respond_to do |format|
      if @campus.save
        flash[:notice] = 'Campus was successfully created.'
        format.html { redirect_to(campus_path @campus) }
        format.xml  { render :xml => @campus, :status => :created, :location => @campus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campuses/1
  # PUT /campuses/1.xml
  def update
    respond_to do |format|
      if @campus.update_attributes(params[:campus])
        flash[:notice] = 'Campus was successfully updated.'
        format.html { redirect_to(campus_path @campus) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campuses/1
  # DELETE /campuses/1.xml
  def destroy
    @campus.destroy
    respond_to do |format|
      format.html { redirect_to(campuses_url) }
      format.xml  { head :ok }
    end
  end
end
