class SchoolSubjectsController < ApplicationController
  # GET /school_subjects
  # GET /school_subjects.xml
  before_filter :login_required
  before_filter :set_cursus

  def index
    params[:footnotes] = "false"
    @school_subjects = @cursus.school_subjects.all

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @school_subjects }
    end
  end

  # GET /school_subjects/1
  # GET /school_subjects/1.xml
  def show
    @school_subject = SchoolSubject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_subject }
    end
  end

  # GET /school_subjects/new
  # GET /school_subjects/new.xml
  def new
    @school_subject = @cursus.school_subjects.build

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @school_subject }
    end
  end

  # GET /school_subjects/1/edit
  def edit
    params[:footnotes] = "false"
    @school_subject = SchoolSubject.find(params[:id])
    respond_to do |format|
      format.html {render :layout => false}
    end
  end

  # POST /school_subjects
  # POST /school_subjects.xml
  def create
    @school_subject = @cursus.school_subjects.build(params[:school_subject])

    respond_to do |format|
      if @school_subject.save
        format.html { redirect_to( cursus_school_subjects_path(@cursus) ) }
        format.xml  { render :xml => @school_subject, :status => :created, :location => @school_subject }
      else
        format.js do
          render :status => 500, :partial => "error_partial"
        end
        format.xml  { render :xml => @school_subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /school_subjects/1
  # PUT /school_subjects/1.xml
  def update
    @school_subject = @cursus.school_subjects.find(params[:id])

    respond_to do |format|
      if @school_subject.update_attributes(params[:school_subject])
        format.html { redirect_to( cursus_school_subjects_path(@cursus) ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_subject.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /school_subjects/1
  # DELETE /school_subjects/1.xml
  def destroy
    @school_subject = SchoolSubject.find(params[:id])
    @school_subject.destroy

    respond_to do |format|
      format.html { redirect_to( cursus_school_subjects_path(@cursus) ) }
      format.xml  { head :ok }
    end
  end

  def set_cursus
    @cursus = Cursus.find(params[:cursus_id])
  end

end
