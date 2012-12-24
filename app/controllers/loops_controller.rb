class LoopsController < ApplicationController
  # GET /loops
  # GET /loops.json
  before_filter :require_membership, except: [:index, :new, :create]

  def index
    @loops = current_user.loops

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loops }
    end
  end

  # GET /loops/1
  # GET /loops/1.json
  def show
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loop }
    end
  end

  # GET /loops/new
  # GET /loops/new.json
  def new
    @loop = Loop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loop }
    end
  end

  # GET /loops/1/edit
  def edit
    @loop = Loop.find(params[:id])
  end

  # POST /loops
  # POST /loops.json
  def create
    @loop = Loop.new(params[:loop])

    respond_to do |format|
      if @loop.save
        format.html { redirect_to @loop, notice: 'Loop was successfully created.' }
        format.json { render json: @loop, status: :created, location: @loop }
      else
        format.html { render action: "new" }
        format.json { render json: @loop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loops/1
  # PUT /loops/1.json
  def update
    @loop = Loop.find(params[:id])

    respond_to do |format|
      if @loop.update_attributes(params[:loop])
        format.html { redirect_to @loop, notice: 'Loop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loops/1
  # DELETE /loops/1.json
  def destroy
    @loop = Loop.find(params[:id])
    @loop.destroy

    respond_to do |format|
      format.html { redirect_to loops_url }
      format.json { head :no_content }
    end
  end

  private
    def require_membership
      @loop = Loop.find(params[:id])
      lm = LoopMembership.where(loop_id: @loop.id, user_id: current_user.id)
      redirect_to loops_path if lm.empty?
    end

end
