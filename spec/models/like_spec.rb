require 'rails_helper'

RSpec.describe Like, type: :model do
  # シンプルなスコープなので、実際はやらなくていいかもしれない
  # 今回はテスト目的で実施する。
  it "returns likes that match user and foodhistory" do
    user = FactoryBot.create(:user)
    foodhistory = FactoryBot.create(:foodhistory)
    FactoryBot.create(:like, user: user, foodhistory: foodhistory)

    expect(Like.by_user_and_foodhistory(user, foodhistory).size).to eq 1
  end
end
