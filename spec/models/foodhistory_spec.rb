require 'rails_helper'

RSpec.describe Foodhistory, type: :model do
  let(:user) { create(:user) }
  let(:foodhistory) { create(:foodhistory) }

  describe "#like" do
    before do
      foodhistory.like(user)
    end

    it { expect(Like.by_user_and_foodhistory(user, foodhistory).exists?).to be true }
    it { expect(foodhistory).to be_liked_by(user) }
    it { expect(Notification.where(user: foodhistory.user).size).to eq(1) }
    it { expect(ActionMailer::Base.deliveries.size).to eq(1) }

    context 'when already liked' do
      it 'should be able to unlike' do
        foodhistory.unlike(user)
        expect(Like.by_user_and_foodhistory(user, foodhistory).exists?).not_to be true
        expect(foodhistory).not_to be_liked_by(user)
        # 以下は暫定のexample。Issue#37で修正される予定
        expect(Notification.where(user: foodhistory.user).size).to eq(0)
      end
    end
  end

  describe "#unlike" do
    it 'should not be able to unlike to unliked foodhistory' do
      expect {
        foodhistory.unlike(user)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
