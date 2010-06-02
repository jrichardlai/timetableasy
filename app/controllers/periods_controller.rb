class PeriodsController < ApplicationController
  # GET /periods
  # GET /periods.xml
  before_filter :login_required
  before_filter :set_cursus

  def index
    params[:footnotes] = "false"
    @periods = @cursus.periods.all

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @periods }
    end
  end

  # GET /periods/1
  # GET /periods/1.xml
  def show
    @period = Period.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @period }
    end
  end

  # GET /periods/new
  # GET /periods/new.xml
  def new
    @period = @cursus.periods.build

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @period }
    end
  end

  # GET /periods/1/edit
  def edit
    params[:footnotes] = "false"
    @period = Period.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /periods
  # POST /periods.xml
  def create
    @period = @cursus.periods.build(params[:period])

    respond_to do |format|
      if @period.save
        format.html { redirect_to( cursus_periods_path(@cursus) ) }
        format.xml  { render :xml => @period, :status => :created, :location => @period }
      else
        format.js do
          render :status => 500, :partial => "error_partial"
        end
        format.xml  { render :xml => @period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periods/1
  # PUT /periods/1.xml
  def update
    @period = @cursus.periods.find(params[:id])

    respond_to do |format|
      if @period.update_attributes(params[:period])
        flash[:notice] = 'Period was successfully updated.'
        format.html { redirect_to( cursus_periods_path(@cursus) ) }
        format.xml  { head :ok }
      else
        format.js do
          render :status => 500, :partial => "error_partial"
        end
        format.xml  { render :xml => @period.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.xml
  def destroy
    @period = Period.find(params[:id])
    @period.destroy

    respond_to do |format|
      format.html { redirect_to( cursus_periods_path(@cursus) ) }
      format.xml  { head :ok }
    end
  end

  def set_cursus
    @cursus = Cursus.find(params[:cursus_id])
  end


end
