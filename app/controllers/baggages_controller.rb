class BaggagesController < ApplicationController
  # GET /baggages
  # GET /baggages.json
  def index
    @baggages = Baggage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @baggages }
    end
  end

  # GET /baggages/1
  # GET /baggages/1.json
  def show
    @baggage = Baggage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @baggage }
    end
  end

  # GET /baggages/new
  # GET /baggages/new.json
  def new
    @baggage = Baggage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @baggage }
    end
  end

  # GET /baggages/1/edit
  def edit
    @baggage = Baggage.find(params[:id])
  end

  # POST /baggages
  # POST /baggages.json
  def create
    @baggage = Baggage.new(params[:baggage])

    respond_to do |format|
      if @baggage.save
        format.html { redirect_to @baggage, notice: 'Baggage was successfully created.' }
        format.json { render json: @baggage, status: :created, location: @baggage }
      else
        format.html { render action: "new" }
        format.json { render json: @baggage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /baggages/1
  # PUT /baggages/1.json
  def update
    @baggage = Baggage.find(params[:id])

    respond_to do |format|
      if @baggage.update_attributes(params[:baggage])
        format.html { redirect_to @baggage, notice: 'Baggage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @baggage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baggages/1
  # DELETE /baggages/1.json
  def destroy
    @baggage = Baggage.find(params[:id])
    @baggage.destroy

    respond_to do |format|
      format.html { redirect_to baggages_url }
      format.json { head :no_content }
    end
  end
end
