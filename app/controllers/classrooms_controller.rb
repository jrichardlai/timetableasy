class ClassroomsController < ApplicationController
  before_filter :login_required
  load_and_authorize_resource

  # GET /classrooms
  # GET /classrooms.xml
  def index
    @classrooms = Classroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.xml

  # GET /classrooms/new
  # GET /classrooms/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
  end

  # POST /classrooms
  # POST /classrooms.xml
  def create
    respond_to do |format|
      if @classroom.save
        flash[:notice] = 'Classroom was successfully created.'
        format.html { redirect_to(@classroom) }
        format.xml  { render :xml => @classroom, :status => :created, :location => @classroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.xml
  def update
    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        flash[:notice] = 'Classroom was successfully updated.'
        format.html { redirect_to(@classroom) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @classroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.xml
  def destroy
    @classroom.destroy
    respond_to do |format|
      format.html { redirect_to(classrooms_url) }
      format.xml  { head :ok }
    end
  end
end
