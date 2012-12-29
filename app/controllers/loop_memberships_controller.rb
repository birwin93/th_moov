class LoopMembershipsController < ApplicationController
  # GET /loop_memberships
  # GET /loop_memberships.json

  before_filter :load_loop_membership, only: [:accept, :decline]

  def accept
    if @loop_membership.accept!
      flash[:notice] = "Joined #{@loop_membership.loop.name}"
    end
    redirect_to @loop_membership.loop
  end

  def decline
    @loop_membership.decline!
    redirect_to current_user
  end


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
    @loop = Loop.new
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

    @user = User.where(firstName: params[:user][:firstName]).first
    @loop = Loop.find(params[:loop_id])

    if @user
      lm = @user.loop_memberships.build(loop_id: @loop.id)
      lm.status = "pending"
      lm.author_id = current_user.id
      lm.save
      flash[:success] = "invitation sent"
      redirect_to loop_path(@loop)
    else 
      flash[:error] = "error with invitation"
      redirect_to loop_path(@loop)
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

  private
    def load_loop_membership
      @loop_membership = current_user.loop_memberships.find(params[:id])
    end
end
