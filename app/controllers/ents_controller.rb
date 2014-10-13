class EntsController < ApplicationController
  before_action :set_ent, only: [:show, :edit, :update, :destroy]

  # GET /ents
  # GET /ents.json
  def index
    @ents = Ent.page(params[:page])
  end

  # GET /ents/1
  # GET /ents/1.json
  def show
  end

  # GET /ents/new
  def new
    @ent = Ent.new
  end

  # GET /ents/1/edit
  def edit
  end

  # POST /ents
  # POST /ents.json
  def create
    @ent = Ent.new(ent_params)

    respond_to do |format|
      if @ent.save
        format.html { redirect_to @ent, notice: 'Ent was successfully created.' }
        format.json { render :show, status: :created, location: @ent }
      else
        format.html { render :new }
        format.json { render json: @ent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ents/1
  # PATCH/PUT /ents/1.json
  def update
    respond_to do |format|
      if @ent.update(ent_params)
        format.html { redirect_to @ent, notice: 'Ent was successfully updated.' }
        format.json { render :show, status: :ok, location: @ent }
      else
        format.html { render :edit }
        format.json { render json: @ent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ents/1
  # DELETE /ents/1.json
  def destroy
    @ent.destroy
    respond_to do |format|
      format.html { redirect_to ents_url, notice: 'Ent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ent
      @ent = Ent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ent_params
      params.require(:ent).permit(:title, :desc, :link, :author, :pub)
    end
end
