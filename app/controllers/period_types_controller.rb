class PeriodTypesController < ApplicationController
  # GET /period_types
  # GET /period_types.xml
  before_filter :login_required
  def index
    @period_types = PeriodType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @period_types }
    end
  end

  # GET /period_types/1
  # GET /period_types/1.xml
  def show
    @period_type = PeriodType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @period_type }
    end
  end

  # GET /period_types/new
  # GET /period_types/new.xml
  def new
    @period_type = PeriodType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @period_type }
    end
  end

  # GET /period_types/1/edit
  def edit
    @period_type = PeriodType.find(params[:id])
  end

  # POST /period_types
  # POST /period_types.xml
  def create
    @period_type = PeriodType.new(params[:period_type])

    respond_to do |format|
      if @period_type.save
        format.html { redirect_to(@period_type) }
        format.xml  { render :xml => @period_type, :status => :created, :location => @period_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @period_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /period_types/1
  # PUT /period_types/1.xml
  def update
    @period_type = PeriodType.find(params[:id])

    respond_to do |format|
      if @period_type.update_attributes(params[:period_type])
        format.html { redirect_to(@period_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @period_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /period_types/1
  # DELETE /period_types/1.xml
  def destroy
    @period_type = PeriodType.find(params[:id])
    @period_type.destroy

    respond_to do |format|
      format.html { redirect_to(period_types_url) }
      format.xml  { head :ok }
    end
  end
end
