class LoopMembershipsController < ApplicationController
  # GET /loop_memberships
  # GET /loop_memberships.json
  def index
    @loop_memberships = LoopMembership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loop_memberships }
    end
  end

  # GET /loop_memberships/1
  # GET /loop_memberships/1.json
  def show
    @loop_membership = LoopMembership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loop_membership }
    end
  end

  # GET /loop_memberships/new
  # GET /loop_memberships/new.json
  def new
    @loop_membership = LoopMembership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loop_membership }
    end
  end

  # GET /loop_memberships/1/edit
  def edit
    @loop_membership = LoopMembership.find(params[:id])
  end

  # POST /loop_memberships
  # POST /loop_memberships.json
  def create
    @loop_membership = LoopMembership.new(params[:loop_membership])

    respond_to do |format|
      if @loop_membership.save
        format.html { redirect_to @loop_membership, notice: 'Loop membership was successfully created.' }
        format.json { render json: @loop_membership, status: :created, location: @loop_membership }
      else
        format.html { render action: "new" }
        format.json { render json: @loop_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loop_memberships/1
  # PUT /loop_memberships/1.json
  def update
    @loop_membership = LoopMembership.find(params[:id])

    respond_to do |format|
      if @loop_membership.update_attributes(params[:loop_membership])
        format.html { redirect_to @loop_membership, notice: 'Loop membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loop_membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loop_memberships/1
  # DELETE /loop_memberships/1.json
  def destroy
    @loop_membership = LoopMembership.find(params[:id])
    @loop_membership.destroy

    respond_to do |format|
      format.html { redirect_to loop_memberships_url }
      format.json { head :no_content }
    end
  end
end
