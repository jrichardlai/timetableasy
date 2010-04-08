class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  before_filter :login_required
  
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
      format.js do 
        render :json => Event.to_fullcalendar(params[:start], params[:end])
      end
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
      format.js
    end
  end

  def move
    @event = Event.find_by_id params[:id]
    if @event
      @event.begin_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.begin_at))
      @event.end_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.end_at))
      @event.save
    end
  end

  def resize
    @event = Event.find_by_id params[:id]
    if @event
      @event.end_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.end_at))
      @event.save
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
        format.js do
          render :update do |page|
            page.alert("Error : #{@event.errors.full_messages}")
          end
        end
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find_by_id(params[:event][:id])
    @event.attributes = params[:event]
    @event.save
    render :update do |page|
      page << "$('#calendar').fullCalendar( 'refetchEvents' )"
      page << "$('#desc_dialog').dialog('destroy')" 
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find_by_id(params[:id])
    @event.destroy
    render :update do |page|
      page << "$('#calendar').fullCalendar( 'refetchEvents' )"
      page << "$('#desc_dialog').dialog('destroy')" 
    end
  end
end
