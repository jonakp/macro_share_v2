class UserfeaturesController < ApplicationController
  before_action :set_userfeature, only: [:show, :edit, :update, :destroy]

  # GET /userfeatures
  # GET /userfeatures.json
  def index
    @userfeatures = Userfeature.all
  end

  # GET /userfeatures/1
  # GET /userfeatures/1.json
  def show
  end

  # GET /userfeatures/new
  def new
    @userfeature = current_user.userfeatures.build
  end

  # GET /userfeatures/1/edit
  def edit
  end

  # POST /userfeatures
  # POST /userfeatures.json
  def create
    @user = current_user

    respond_to do |format|
      if @user.update(nested_user_params)
        format.html { redirect_to @user, notice: 'Userfeature was successfully created.' }
        format.json { render :show, status: :created, location: @userfeature }
      else
        format.html { render :new }
        format.json { render json: @userfeature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userfeatures/1
  # PATCH/PUT /userfeatures/1.json
  def update
    @user = current_user

    confirm_userfeature_update_skip()
    respond_to do |format|
      if @user.update(nested_user_params)
        format.html { redirect_to @userfeature.user, notice: 'Userfeature was successfully updated.' }
        format.json { render :show, status: :ok, location: @userfeature }
      else
        format.html { render :edit }
        format.json { render json: @userfeature.errors, status: :unprocessable_entity }
      end
    end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def nested_user_params
      params.require(:user).permit(
        :name,
        :gender,
        userfeatures_attributes: [:id, :height, :weight, :age, :activity, :purpose]
      )
    end

    # <Issue#20>
    # userfeaturesのattributesは更新されないが、
    # user(のgender)が更新される場合は、
    # user modelのcall backからculcurate_calorie_macroを行う。
    # user modelで対象のuserfeatureを判別できるようにするために、
    # @user.userfeature_idを設定する。
    def confirm_userfeature_update_skip
      userfeature_params = params[:user][:userfeatures_attributes][:'0']
      @user.userfeature_id = userfeature_params[:id] if no_userfeature_update?(userfeature_params)
    end

    def no_userfeature_update?(userfeature_params)
      # 本来は@userfeatureのソートなり要素の削除なりした上でrejectの利用が必要そうだが、
      # このケースではuserfeature_paramsの構造上必要なかった
      userfeature_params.reject { |k, v| v == @userfeature[k].to_s }.keys.blank?
    end
end
