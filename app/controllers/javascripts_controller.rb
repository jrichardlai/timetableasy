class JavascriptsController < ApplicationController

  def event_types
    @klass = params[:type].camelize if params[:type]
    render :update do |page|
      page.replace_html 'event_scope_id_select', collection_select(:event, :event_scope_id, Kernel.const_get(@klass).all, :id, :name) 
    end if @klass
  end

end