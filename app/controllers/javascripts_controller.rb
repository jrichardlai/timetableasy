class JavascriptsController < ApplicationController

  def event_types
    @klass = params[:type].camelize if params[:type]
    render :update do |page|
      @records = (current_user.manager? ? current_user.send(@klass.to_s.downcase.pluralize) : Kernel.const_get(@klass).all)
      select_name = (@records.first.respond_to?(:name_for_select) ? 'name_for_select' : 'name').to_sym
      page.replace_html 'event_scope_id_select', collection_select(:event, :event_scope_id, @records, :id, select_name, :include_blank => true) 
    end if @klass
  end

  def school_subjects
    @classroom = Classroom.find(params[:classroom_id]) unless params[:classroom_id].blank?
    render :update do |page|
      # TODO change the options for the classroom
    end
  end

  def teaching_methods
    @school_subject = SchoolSubject.find(params[:school_subject_id]) unless params[:school_subject_id].blank?
    render :update do |page|
      # TODO change options pour teaching
    end
  end

end