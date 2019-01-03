class UserfeatureForm
  include Virtus.model

  include ActiveModel::Model

  attr_reader :user
  attr_reader :userfeature

  attribute :name, String
  attribute :gender, Integer
  attribute :id, Integer
  attribute :height, Integer
  attribute :weight, Integer
  attribute :age, Integer
  attribute :activity, Integer
  attribute :purpose, Integer

  def initialize(user, userfeature)
    @user = user
    @userfeature = userfeature

    self.attributes = user.attributes.symbolize_keys.slice(:name, :gender)
    self.attributes = userfeature.attributes.symbolize_keys.slice(
      :id, :height, :weight, :age, :activity, :purpose
    )
  end

  def self.build(user)
    UserfeatureForm.new(user, user.userfeatures.build)
  end

  def self.find(user, userfeature_id)
    UserfeatureForm.new(user, Userfeature.find(userfeature_id))
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  def persisted?
    @userfeature.persisted?
  end

  private

    def persist!
      ActiveRecord::Base.transaction do
        @user.attributes = { name: name, gender: gender }
        @userfeature.attributes = {
          height: height,
          weight: weight,
          age: age,
          activity: activity,
          purpose: purpose
        }

        @user.save!
        @userfeature.save!
      end
    end
end
