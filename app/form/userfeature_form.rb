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

  def self.build(user)
    self.new(user, user.userfeatures.new)
  end

  def self.find(user, userfeature_id)
    self.new(user, user.userfeatures.find(userfeature_id))
  end

  def initialize(user, userfeature)
    @user = user
    @userfeature = userfeature

    self.attributes = userfeature.attributes.symbolize_keys.slice(
      :id, :height, :weight, :age, :activity, :purpose
    )

    self.attributes = user.attributes.symbolize_keys.slice(:name, :gender)
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
