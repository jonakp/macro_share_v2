class FoodhistoryImagesController < ApplicationController
  # DELETE /foodhistory_images/1
  # DELETE /foodhistory_images/1.json
  def destroy
    foodhistory_image = FoodhistoryImage.find(params[:id])
    foodhistory_id = foodhistory_image.foodhistory.id
    foodhistory_image.destroy
    respond_to do |format|
      format.html { redirect_to edit_foodhistory_path(id: foodhistory_id), notice: 'Foodhistory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
