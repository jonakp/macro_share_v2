require 'rails_helper'

RSpec.describe Foodhistory, type: :model do
  let(:user) { create(:user) }
  let(:foodhistory) { create(:foodhistory) }

  describe "#liked_by?" do
    context "before liked" do
      it { expect(foodhistory.liked_by?(user)).to be_falsey }
    end
  end

  describe "#like" do
    before do
      foodhistory.like(user)
    end
    it { expect(Like.by_user_and_foodhistory(user, foodhistory).first.activate_status?).to be true }
    it { expect(foodhistory).to be_liked_by(user) }
    it { expect(Notification.where(user: foodhistory.user).size).to eq(1) }
    # it { expect(ActionMailer::Base.deliveries.size).to eq(1) }

    context 'when already liked' do
      it 'should be able to unlike' do
        foodhistory.unlike(user)
        expect(Like.by_user_and_foodhistory(user, foodhistory).first.inactivate_status?).to be true
        expect(foodhistory).not_to be_liked_by(user)
        expect(Notification.where(user: foodhistory.user).size).to eq(1)
      end

      context 'return to unliked' do
        it 'should be able to like again' do
          foodhistory.unlike(user)
          foodhistory.like(user)
          expect(Like.by_user_and_foodhistory(user, foodhistory).first.activate_status?).to be true
          expect(foodhistory).to be_liked_by(user)
          expect(Notification.where(user: foodhistory.user).size).to eq(2)
          # expect(ActionMailer::Base.deliveries.size).to eq(2)
        end
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
