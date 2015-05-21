class NextPickNumbersController < ApplicationController
  # GET /next_pick_numbers
  # GET /next_pick_numbers.json
  def index
    @next_pick_numbers = NextPickNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @next_pick_numbers }
    end
  end

  # GET /next_pick_numbers/1
  # GET /next_pick_numbers/1.json
  def show
    @next_pick_number = NextPickNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @next_pick_number }
    end
  end

  # GET /next_pick_numbers/new
  # GET /next_pick_numbers/new.json
  def new
    @next_pick_number = NextPickNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @next_pick_number }
    end
  end

  # GET /next_pick_numbers/1/edit
  def edit
    @next_pick_number = NextPickNumber.find(params[:id])
  end

  # POST /next_pick_numbers
  # POST /next_pick_numbers.json
  def create
    @next_pick_number = NextPickNumber.new(params[:next_pick_number])

    respond_to do |format|
      if @next_pick_number.save
        format.html { redirect_to @next_pick_number, notice: 'Next pick number was successfully created.' }
        format.json { render json: @next_pick_number, status: :created, location: @next_pick_number }
      else
        format.html { render action: "new" }
        format.json { render json: @next_pick_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /next_pick_numbers/1
  # PUT /next_pick_numbers/1.json
  def update
    @next_pick_number = NextPickNumber.find(params[:id])

    respond_to do |format|
      if @next_pick_number.update_attributes(params[:next_pick_number])
        format.html { redirect_to @next_pick_number, notice: 'Next pick number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @next_pick_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /next_pick_numbers/1
  # DELETE /next_pick_numbers/1.json
  def destroy
    @next_pick_number = NextPickNumber.find(params[:id])
    @next_pick_number.destroy

    respond_to do |format|
      format.html { redirect_to next_pick_numbers_url }
      format.json { head :no_content }
    end
  end
end
