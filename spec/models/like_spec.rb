require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:foodhistory) { create(:foodhistory) }

  # シンプルなスコープなので、実際はやらなくていいかもしれない
  # 今回はテスト目的で実施する。
  it "returns likes that match user and foodhistory" do
    # 関連付け先を指定してFactoryBot.createできる例として、以下コメントで残しておく
    # create(:like, user: user, foodhistory: foodhistory)
    foodhistory.like(user)
    expect(Like.by_user_and_foodhistory(user, foodhistory).size).to eq 1
  end
end
