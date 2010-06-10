class TeachingMethodsController < ApplicationController
  # GET /teaching_methods
  # GET /teaching_methods.xml
  before_filter :login_required
  before_filter :set_school_subject

  def index
    params[:footnotes] = "false"
    @teaching_methods = @school_subject.teaching_methods.all

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @teaching_methods }
    end
  end

  # GET /teaching_methods/1
  # GET /teaching_methods/1.xml
  def show
    @teaching_method = TeachingMethod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teaching_method }
    end
  end

  # GET /teaching_methods/new
  # GET /teaching_methods/new.xml
  def new
    @teaching_method = @school_subject.teaching_methods.build

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @teaching_method }
    end
  end

  # GET /teaching_methods/1/edit
  def edit
    params[:footnotes] = "false"
    @teaching_method = TeachingMethod.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /teaching_methods
  # POST /teaching_methods.xml
  def create
    @teaching_method = @school_subject.teaching_methods.build(params[:teaching_method])

    respond_to do |format|
      if @teaching_method.save
        format.html { redirect_to( school_subject_teaching_methods_path(@school_subject) ) }
        format.xml  { render :xml => @teaching_method, :status => :created, :location => @teaching_method }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teaching_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teaching_methods/1
  # PUT /teaching_methods/1.xml
  def update
    @teaching_method = @school_subject.teaching_methods.find(params[:id])

    respond_to do |format|
      if @teaching_method.update_attributes(params[:teaching_method])
        format.html { redirect_to( school_subject_teaching_methods_path(@school_subject) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teaching_method.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_methods/1
  # DELETE /teaching_methods/1.xml
  def destroy
    @teaching_method = TeachingMethod.find(params[:id])
    @teaching_method.destroy

    respond_to do |format|
      format.html { redirect_to( school_subject_teaching_methods_path(@school_subject) ) }
      format.xml  { head :ok }
    end
  end

  def set_school_subject
    @school_subject = SchoolSubject.find(params[:school_subject_id])
  end

end
