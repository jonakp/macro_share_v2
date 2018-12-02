class LikesController < ApplicationController
  def create
    foodhistory = Foodhistory.find(params[:foodhistory_id])
    foodhistory.like(current_user)
    redirect_to foodhistories_path
  end

  def destroy
    foodhistory = Like.find(params[:id]).foodhistory
    foodhistory.unlike(current_user)
    redirect_to foodhistories_path
  end
end
