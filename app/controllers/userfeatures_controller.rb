class UserfeaturesController < ApplicationController
  before_action :set_userfeature, only: [:show, :destroy]

  # GET /userfeatures
  # GET /userfeatures.json
  def index
    @userfeatures = Userfeature.all
  end

  # GET /userfeatures/1
  # GET /userfeatures/1.json
  def show
  end

  # DELETE /userfeatures/1
  # DELETE /userfeatures/1.json
  def destroy
    @userfeature.destroy
    respond_to do |format|
      format.html { redirect_to userfeatures_url, notice: 'Userfeature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userfeature
      @userfeature = Userfeature.find(params[:id])
    end
end
