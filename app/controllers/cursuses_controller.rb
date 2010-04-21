class CursusesController < ApplicationController
  # GET /cursuses
  # GET /cursuses.xml
  
  before_filter :login_required
  
  def index
    @cursuses = Cursus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cursuses }
    end
  end

  # GET /cursuses/1
  # GET /cursuses/1.xml
  def show
    @cursus = Cursus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cursus }
    end
  end

  # GET /cursuses/new
  # GET /cursuses/new.xml
  def new
    @cursus = Cursus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cursus }
    end
  end

  # GET /cursuses/1/edit
  def edit
    @cursus = Cursus.find(params[:id])
  end

  # POST /cursuses
  # POST /cursuses.xml
  def create
    @cursus = Cursus.new(params[:cursus])

    respond_to do |format|
      if @cursus.save
        flash[:notice] = 'Cursus was successfully created.'
        format.html { redirect_to(cursus_path @cursus) }
        format.xml  { render :xml => @cursus, :status => :created, :location => @cursus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cursus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursuses/1
  # PUT /cursuses/1.xml
  def update
    @cursus = Cursus.find(params[:id])

    respond_to do |format|
      if @cursus.update_attributes(params[:cursus])
        flash[:notice] = 'Cursus was successfully updated.'
        format.html { redirect_to(cursus_path @cursus) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cursus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursuses/1
  # DELETE /cursuses/1.xml
  def destroy
    @cursus = Cursus.find(params[:id])
    @cursus.destroy

    respond_to do |format|
      format.html { redirect_to(cursuses_url) }
      format.xml  { head :ok }
    end
  end
end
