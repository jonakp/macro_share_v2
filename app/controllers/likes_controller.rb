class LikesController < ApplicationController
  def create
    foodhistory = Foodhistory.find(params[:foodhistory_id])
    current_user.like(foodhistory)
    redirect_to foodhistories_path
  end

  def destroy
    foodhistory = Like.find(params[:id]).foodhistory
    current_user.unlike(foodhistory)
    redirect_to foodhistories_path
  end
end
