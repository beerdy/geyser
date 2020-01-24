class ParthnersController < ApplicationController
  before_action :set_parthner, only: [:show, :edit, :update, :destroy]

  # GET /parthners
  # GET /parthners.json
  def index
  end

  # GET /parthners/1
  # GET /parthners/1.json
  def show
    @parthners = Parthner.all
  end

  # GET /parthners/new
  def new
    @parthner = Parthner.new
  end

  # # GET /parthners/1/edit
  # def edit
  # end

  # # POST /parthners
  # # POST /parthners.json
  # def create
  #   @parthner = Parthner.new(parthner_params)

  #   respond_to do |format|
  #     if @parthner.save
  #       format.html { redirect_to @parthner, notice: 'Parthner was successfully created.' }
  #       format.json { render :show, status: :created, location: @parthner }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @parthner.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /parthners/1
  # # PATCH/PUT /parthners/1.json
  # def update
  #   respond_to do |format|
  #     if @parthner.update(parthner_params)
  #       format.html { redirect_to @parthner, notice: 'Parthner was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @parthner }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @parthner.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /parthners/1
  # # DELETE /parthners/1.json
  # def destroy
  #   @parthner.destroy
  #   respond_to do |format|
  #     format.html { redirect_to parthners_url, notice: 'Parthner was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parthner
      @parthner = Parthner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parthner_params
      params.require(:parthner).permit(:title, :description, :url, :link, :complectation_id, :show)
    end
end
