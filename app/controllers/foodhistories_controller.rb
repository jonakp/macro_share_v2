class FoodhistoriesController < ApplicationController
  before_action :set_foodhistory, only: [:show, :edit, :update, :destroy]

  # GET /foodhistories
  # GET /foodhistories.json
  def index
    @q = Foodhistory.ransack(params[:q])
    @foodhistories = @q.result(distinct: true)
  end

  # GET /foodhistories/1
  # GET /foodhistories/1.json
  def show
  end

  # GET /foodhistories/new
  def new
    if reuse_id = foodhistory_reuse_param[:reuse_record_id]
      @foodhistory = Foodhistory.find(reuse_id).dup
    else
      @foodhistory = Foodhistory.new
    end
  end

  # GET /foodhistories/1/edit
  def edit
  end

  # POST /foodhistories
  # POST /foodhistories.json
  def create
    @foodhistory = Foodhistory.new(foodhistory_params)
    @foodhistory.user_id = current_user.id

    respond_to do |format|
      if @foodhistory.save
        format.html { redirect_to @foodhistory, notice: 'Foodhistory was successfully created.' }
        format.json { render :show, status: :created, location: @foodhistory }
      else
        format.html { render :new }
        format.json { render json: @foodhistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foodhistories/1
  # PATCH/PUT /foodhistories/1.json
  def update
    respond_to do |format|
      if @foodhistory.update(foodhistory_params)
        format.html { redirect_to @foodhistory, notice: 'Foodhistory was successfully updated.' }
        format.json { render :show, status: :ok, location: @foodhistory }
      else
        format.html { render :edit }
        format.json { render json: @foodhistory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foodhistories/1
  # DELETE /foodhistories/1.json
  def destroy
    @foodhistory.destroy
    respond_to do |format|
      format.html { redirect_to foodhistories_url, notice: 'Foodhistory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foodhistory
      @foodhistory = Foodhistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foodhistory_params
      params.require(:foodhistory).permit(:name, :calorie, :protein, :fat, :carbo, :image_name)
    end

    def foodhistory_reuse_param
      params.permit(:reuse_record_id)
    end
end
