class LoopEventSharesController < ApplicationController
  # GET /loop_event_shares
  # GET /loop_event_shares.json

  #before_filter :get_loop, except: [:create]

  def index
    #@loop_event_shares = LoopEventShare.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @loop_event_shares }
    end
  end

  # GET /loop_event_shares/1
  # GET /loop_event_shares/1.json
  def show
    @loop_event_share = LoopEventShare.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loop_event_share }
    end
  end

  # GET /loop_event_shares/new
  # GET /loop_event_shares/new.json
  def new
    @loop_event_share = LoopEventShare.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loop_event_share }
    end
  end

  # GET /loop_event_shares/1/edit
  def edit
    @loop_event_share = LoopEventShare.find(params[:id])
  end

  # POST /loop_event_shares
  # POST /loop_event_shares.json
  def create
    @loop = Loop.find(params[:loop_id])
    @event = Event.find(params[:event_id])
    @loop_event_share = LoopEventShare.new(loop_id: @loop.id, event_id: @event.id)
    respond_to do |format|
      if @loop_event_share.save
        format.html { redirect_to @event, notice: 'Loop event share was successfully created.' }
        format.json { render json: @loop_event_share, status: :created, location: @loop_event_share }
      else
        format.html { render action: "new" }
        format.json { render json: @loop_event_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /loop_event_shares/1
  # PUT /loop_event_shares/1.json
  def update
    @loop_event_share = LoopEventShare.find(params[:id])

    respond_to do |format|
      if @loop_event_share.update_attributes(params[:loop_event_share])
        format.html { redirect_to @loop_event_share, notice: 'Loop event share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loop_event_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loop_event_shares/1
  # DELETE /loop_event_shares/1.json
  def destroy
    @loop_event_share = LoopEventShare.find(params[:id])
    @loop_event_share.destroy

    respond_to do |format|
      format.html { redirect_to loop_event_shares_url }
      format.json { head :no_content }
    end
  end

  private
    def get_loop
      @loop = Loop.find(params[:id])
    end
end
