class UserfeatureForm
  include Virtus.model

  include ActiveModel::Model

  attr_reader :user
  attr_reader :userfeature

  attribute :id, Integer
  attribute :name, String
  attribute :gender, Integer
  attribute :height, Integer
  attribute :weight, Integer
  attribute :age, Integer
  attribute :activity, Integer
  attribute :purpose, Integer
  attribute :user, User
  attribute :userfeature, Userfeature

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def update
    if valid?
      update_forms!
      true
    else
      false
    end
  end

  def persisted?
    @userfeature
  end

  private

    def persist!
      ActiveRecord::Base.transaction do
        @user.update!(user_params)
        @userfeature = user.userfeatures.create!(userfeature_params)
      end
    end

    def update_forms!
      ActiveRecord::Base.transaction do
        @user.update!(user_params)
        @userfeature.update!(userfeature_params)
      end
    end

    def user_params
      { name: name, gender: gender }
    end

    def userfeature_params
      {
        height: height,
        weight: weight,
        age: age,
        activity: activity,
        purpose: purpose
      }
    end
end
