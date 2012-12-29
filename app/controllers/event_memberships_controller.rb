class EventMembershipsController < ApplicationController
  # GET /event_memberships
  # GET /event_memberships.json
  def index
    @event_memberships = EventMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_memberships }
    end
  end

  # GET /event_memberships/1
  # GET /event_memberships/1.json
  def show
    @event_membership = EventMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_membership }
    end
  end

  # GET /event_memberships/new
  # GET /event_memberships/new.json
  def new
    @event_membership = EventMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_membership }
    end
  end

  # GET /event_memberships/1/edit
  def edit
    @event_membership = EventMembership.find(params[:id])
  end

  # POST /event_memberships
  # POST /event_memberships.json
  def create
    @event_membership = EventMembership.new(params[:event_membership])

    respond_to do |format|
      if @event_membership.save
        format.html { redirect_to @event_membership, notice: 'Event membership was successfully created.' }
        format.json { render json: @event_membership, status: :created, location: @event_membership }
      else
        format.html { render action: "new" }
        format.json { render json: @event_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_memberships/1
  # PUT /event_memberships/1.json
  def update
    @event_membership = EventMembership.find(params[:id])

    respond_to do |format|
      if @event_membership.update_attributes(params[:event_membership])
        format.html { redirect_to @event_membership, notice: 'Event membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_memberships/1
  # DELETE /event_memberships/1.json
  def destroy
    @event_membership = EventMembership.find(params[:id])
    @event_membership.destroy

    respond_to do |format|
      format.html { redirect_to event_memberships_url }
      format.json { head :no_content }
    end
  end
end
