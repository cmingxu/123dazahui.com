class StarsController < ApplicationController
  before_action :set_star, only: [:show, :edit, :update, :destroy]

  # GET /stars
  # GET /stars.json
  def index
    @stars = Star.page(params[:page]).per(30)
  end

  # GET /stars/1
  # GET /stars/1.json
  def show
  end

  # GET /stars/new
  def new
    @star = Star.new
  end

  # GET /stars/1/edit
  def edit
  end

  # POST /stars
  # POST /stars.json
  def create
    @star = Star.new(star_params)

    respond_to do |format|
      if @star.save
        format.html { redirect_to @star, notice: 'Star was successfully created.' }
        format.json { render :show, status: :created, location: @star }
      else
        format.html { render :new }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stars/1
  # PATCH/PUT /stars/1.json
  def update
    respond_to do |format|
      if @star.update(star_params)
        format.html { redirect_to @star, notice: 'Star was successfully updated.' }
        format.json { render :show, status: :ok, location: @star }
      else
        format.html { render :edit }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stars/1
  # DELETE /stars/1.json
  def destroy
    @star.destroy
    respond_to do |format|
      format.html { redirect_to stars_url, notice: 'Star was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star
      @star = Star.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def star_params
      params.require(:star).permit(:name, :gender, :country, :dob, :constellation, :career, :height, :rate, :blood, :home_town, :school, :company, :weight, :religon, :hobby, :desc, :desc_short, :achievement, :event, :source)
    end
end
