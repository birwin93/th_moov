class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    if params.has_key?(:search)
      @events = []
      tag = params[:search].split(' ')[0]
      Event.tagged_with(tag).each do |event|
        unless @events.include?(event)
          @events << event
        end
      end
    else 
      @events = Event.all
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def search
    @events = []
    tag = params[:search].split(' ')[0]
    Event.tagged_with(tag).each do |event|
      unless @events.include?(event)
        @events << event
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @post = Post.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    if params.has_key?(:loop_id)
      @loop = Loop.find(params[:loop_id])
    else
      @organization = Organization.find(params[:organization_id])
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    if params.has_key?(:loop_id)
      @loop = Loop.find(params[:loop_id])
    else
      @organization = Organization.find(params[:organization_id])
    end
    respond_to do |format|
      if @event.save
        @loop.loop_event_shares.create(event_id: @event.id)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def join
    @event = Event.find(params[:id])
    if current_user.event_memberships.create!(event_id: @event.id)
      flash[:success] = "Added event to your events"
      render 'show'
    else
      flash[:error] = "Failed to attend event"
      render 'show'
    end
  end

  def add_post
    params[:post][:user_id] = current_user.id
    @event = Event.find(params[:id])
    @post = @event.posts.build(params[:post])
    @post.save!

    render :text => "alert('Hello, world!')",
         :content_type => "text/javascript"
  end
end
