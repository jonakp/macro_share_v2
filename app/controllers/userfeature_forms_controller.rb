class UserfeatureFormsController < ApplicationController
  # GET /userfeatures_forms
  def new
    @userfeature_form = UserfeatureForm.build(current_user)
  end

  # GET /userfeature_form/1/edit
  def edit
    @userfeature_form = UserfeatureForm.find(current_user, params[:id])
  end

  # POST /userfeature_forms
  def create
    @userfeature_form = UserfeatureForm.build(current_user)
    @userfeature_form.attributes = userfeature_form_params

    if @userfeature_form.save
      redirect_to @userfeature_form.user, notice: 'Userfeature was successfully created.'
    else
      render :new
    end
  end

  # POST /userfeature_form/1/edit
  def update
    @userfeature_form = UserfeatureForm.find(current_user, params[:id])
    @userfeature_form.attributes = userfeature_form_params
    if @userfeature_form.save
      redirect_to @userfeature_form.user, notice: 'Userfeature was successfully updated.'
    else
      render :edit
    end
  end

  private
  
    def userfeature_form_params
      params.require(:userfeature_form).permit(
        :id,
        :name, :gender,
        :height, :weight, :age, :activity, :purpose
      )
    end
end
