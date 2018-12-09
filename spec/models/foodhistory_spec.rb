require 'rails_helper'

RSpec.describe Foodhistory, type: :model do
  it "is possible to do like-unlike" do
    user = FactoryBot.create(:user)
    foodhistory = FactoryBot.create(:foodhistory)

    expect(foodhistory).not_to be_liked_by(user)

    foodhistory.like(user)
    expect(foodhistory).to be_liked_by(user)

    foodhistory.unlike(user)
    expect(foodhistory).not_to be_liked_by(user)
  end
end
