class JavascriptsController < ApplicationController

  def event_types
    @klass = params[:type].camelize if params[:type]
    render :update do |page|
      page.replace_html 'event_scope_id_select', collection_select(:event, :event_scope_id, Kernel.const_get(@klass).all, :id, :name, :include_blank => true) 
    end if @klass
  end

  def academical
    @classroom = Classroom.find(params[:classroom_id]) unless params[:classroom_id].blank?
    render :update do |page|
      # TODO change the options for the classroom
    end
  end

end