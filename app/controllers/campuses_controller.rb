class CampusesController < ApplicationController
  # GET /campuses
  # GET /campuses.xml
  def index
    @campuses = Campus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campuses }
    end
  end

  # GET /campuses/1
  # GET /campuses/1.xml
  def show
    @campuses = Campus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @campuses }
    end
  end

  # GET /campuses/new
  # GET /campuses/new.xml
  def new
    @campuses = Campus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @campuses }
    end
  end

  # GET /campuses/1/edit
  def edit
    @campuses = Campus.find(params[:id])
  end

  # POST /campuses
  # POST /campuses.xml
  def create
    @campuses = Campus.new(params[:campuses])

    respond_to do |format|
      if @campuses.save
        flash[:notice] = 'Campus was successfully created.'
        format.html { redirect_to(@campuses) }
        format.xml  { render :xml => @campuses, :status => :created, :location => @campuses }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @campuses.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /campuses/1
  # PUT /campuses/1.xml
  def update
    @campuses = Campus.find(params[:id])

    respond_to do |format|
      if @campuses.update_attributes(params[:campuses])
        flash[:notice] = 'Campus was successfully updated.'
        format.html { redirect_to(@campuses) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @campuses.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /campuses/1
  # DELETE /campuses/1.xml
  def destroy
    @campuses = Campus.find(params[:id])
    @campuses.destroy

    respond_to do |format|
      format.html { redirect_to(campuses_url) }
      format.xml  { head :ok }
    end
  end
end
