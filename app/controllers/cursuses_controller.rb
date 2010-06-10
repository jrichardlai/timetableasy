class CursusesController < ApplicationController
  # GET /cursuses
  # GET /cursuses.xml
  
  before_filter :login_required
  load_and_authorize_resource
  
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
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cursus }
    end
  end
  
  def quick_look
     respond_to do |format|
       format.html { render :layout => false }
       format.xml
     end
   end

  # GET /cursuses/new
  # GET /cursuses/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cursus }
    end
  end  

  # GET /cursuses/1/edit
  def edit
  end

  # POST /cursuses
  # POST /cursuses.xml
  def create
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
    @cursus.destroy

    respond_to do |format|
      format.html { redirect_to(cursuses_url) }
      format.xml  { head :ok }
    end
  end
end
