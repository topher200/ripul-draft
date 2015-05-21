class PicksController < ApplicationController
  # GET /picks
  # GET /picks.json
  def index
    @picks_by_gender = { :Female => Pick.females, :Male => Pick.males }
    @admin = cookies[:admin]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @picks }
    end
  end

  # GET /picks/1
  # GET /picks/1.json
  def show
    @pick = Pick.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/new
  # GET /picks/new.json
  def new
    @pick = Pick.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pick }
    end
  end

  # GET /picks/1/edit
  def edit
    @pick = Pick.find(params[:id])
  end

  # POST /picks
  # POST /picks.json
  def create
    @pick = Pick.new(params[:pick])

    respond_to do |format|
      if @pick.save
        format.html { redirect_to @pick, notice: 'Pick was successfully created.' }
        format.json { render json: @pick, status: :created, location: @pick }
      else
        format.html { render action: "new" }
        format.json { render json: @pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /picks/1
  # PUT /picks/1.json
  def update
    # We undo the pick
    @pick = Pick.find(params[:id])
    logger.info "Undoing Pick #{@pick}"
    player = Player.find(@pick.player)
    player.team = nil
    player.save
    @pick.player = nil
    @pick.save

    respond_to do |format|
      format.html { redirect_to picks_url }
      format.json { head :no_content }
    end
  end

  # DELETE /picks/1
  # DELETE /picks/1.json
  def destroy
    @pick = Pick.find(params[:id])
    @pick.destroy

    respond_to do |format|
      format.html { redirect_to picks_url }
      format.json { head :no_content }
    end
  end
end
