class UserfeatureFormsController < ApplicationController
  before_action :set_userfeature_form

  # GET /userfeatures_forms
  def new
    @userfeature_form.attributes = current_form_value
  end

  # GET /userfeature_form/1/edit
  def edit
    @userfeature_form.id = params[:id]
    @userfeature_form.attributes = current_form_value
  end

  # POST /userfeature_forms
  def create
    @userfeature_form.attributes = userfeature_form_params

    if @userfeature_form.save
      redirect_to @userfeature_form.user, notice: 'Userfeature was successfully created.'
    else
      render :new
    end
  end

  # POST /userfeature_form/1/edit
  def update
    @userfeature_form.attributes = userfeature_form_params
    if @userfeature_form.update
      redirect_to @userfeature_form.user, notice: 'Userfeature was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_userfeature_form
      @userfeature_form = UserfeatureForm.new(
        user: current_user,
        userfeature: Userfeature.find_by(id: params[:id])
      )
    end

    def userfeature_form_params
      params.require(:userfeature_form).permit(
        :id,
        :name, :gender,
        :height, :weight, :age, :activity, :purpose
      )
    end

    # 変更前のuser/userfeatureのattributeをhash形式で返す
    # new/edit actionにおいて、
    # view/userfeature_form/_form.html.erb の各formに、初期値を表示させる目的で利用される
    def current_form_value
      hash_user = @userfeature_form.user.attributes.slice("name", "gender")
      if @userfeature_form.userfeature
        hash_userfeature = @userfeature_form.userfeature.attributes.slice("height", "weight", "age", "activity", "purpose")
        hash_user.merge(hash_userfeature)
      else
        hash_user
      end
    end
end
