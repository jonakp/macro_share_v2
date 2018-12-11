require 'rails_helper'

RSpec.describe Foodhistory, type: :model do
  let(:user) { create(:user) }
  let(:foodhistory) { create(:foodhistory) }

  it "should be able to do like-unlike" do
    expect(foodhistory).not_to be_liked_by(user)

    foodhistory.like(user)
    expect(foodhistory).to be_liked_by(user)

    foodhistory.unlike(user)
    expect(foodhistory).not_to be_liked_by(user)
  end
end
