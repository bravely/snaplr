require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#email' do
    it { should validate_presence_of(:email) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:email).with_options(null: false) }
  end

  describe '#posts' do
    it { should have_many(:posts) }
  end

  describe '#follows?' do
    let(:user_one) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user) }
    context 'when user_one follows user_two' do
      before do
        user_one.follow!(user_two)
      end
      it { expect(user_one.follows?(user_two)).to eq Relationship.find_by(follower_id: user_one, followed_id: user_two) }
    end
    context 'when user_one does not follow user_two' do
      before do
        user_one.followed_relationships.destroy_all
      end
      it { expect(user_one.follows?(user_two)).to eq nil }
    end
  end

  describe '#follow!' do
    let(:user_one) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user) }
    before { user_one.follow!(user_two) }
    it { expect(Relationship.find_by(follower: user_one, followed: user_two)).to_not eq nil }
  end

  describe '#unfollow!' do
    let(:user_one) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user) }
    before do
      user_one.follow!(user_two)
      user_one.unfollow!(user_two)
    end
    it { expect(Relationship.find_by(follower: user_one, followed: user_two)).to eq nil }
  end
end
