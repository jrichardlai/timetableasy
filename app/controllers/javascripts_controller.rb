class JavascriptsController < ApplicationController

  def event_types
    @klass = params[:type].camelize if params[:type]
    render :update do |page|
      @records = (current_user.manager? ? current_user.send(@klass.to_s.downcase.pluralize) : Kernel.const_get(@klass).all)
      select_name = (@records.first.respond_to?(:name_for_select) ? 'name_for_select' : 'name').to_sym
      page.replace_html 'event_scope_id_select', collection_select(:event, :event_scope_id, @records, :id, select_name, :include_blank => true) 
    end if @klass
  end

  #return all school subjects for a classroom
  def school_subjects
    @classroom = Classroom.find(params[:classroom_id]) unless params[:classroom_id].blank?
    render :update do |page|
      page.replace_html 'school_subject_select', collection_select(:event, :school_subject_id, @classroom.school_subjects, :id, :name, :include_blank => true)
    end
  end

  #return all the teaching methods for an school subject
  def teaching_methods
    @school_subject = SchoolSubject.find(params[:school_subject_id]) unless params[:school_subject_id].blank?
    TeachingMethod.referal_classroom = Classroom.find(params[:classroom_id]) unless params[:classroom_id].blank?
    render :update do |page|
      page.replace_html 'teaching_method_select', collection_select(:event, :teaching_method_id, @school_subject.teaching_methods, :id, :type_with_allowed_time, :include_blank => true)
    end
  end

  def cursuses
    @cursuses = Campus.find(params[:campus_id]).cursuses
    render :update do |page|
      js_selector = @cursuses.collect {|cursus| "[value!=#{cursus.id}]"}.join('')
      page.show 'classroom_cursus'
      # [value!=1][value!=2]
      page << "$('#classroom_cursus_id option').show();"
      page << "$('#classroom_cursus_id option#{js_selector}').hide()"
    end
  end

  #hide rooms that not belongs to a campus or a classroom campus
  def rooms
    @rooms = case params[:type]
    when 'Campus'
      Campus.find(params[:id]).rooms
    when 'Classroom'
      Classroom.find(params[:id]).campus.rooms
    end
    render :update do |page|
      js_selector = @rooms.collect {|room| "[value!=#{room.id}]"}.join('')
      # [value!=1][value!=2]
      page << "$('#event_room_id option').show();"
      page << "$('#event_room_id option#{js_selector}').hide()"
    end
  end

end