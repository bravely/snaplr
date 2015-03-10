require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    let(:user) { FactoryGirl.create(:user) }
    let(:post_one) { FactoryGirl.create(:post, user: user, created_at: 1.day.ago) }
    let(:post_two) { FactoryGirl.create(:post, user: user, created_at: Time.current) }
    before do
      sign_in user
      get :show, id: user.id
    end
    it { should respond_with :ok }
    it { should render_template :show }
    it { expect(assigns(:posts)).to eq [post_two, post_one] }
  end

  describe 'GET #follow' do
    let(:user_one) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user) }
    before do
      sign_in user_one
      get :follow, id: user_two.id
    end
    it { should redirect_to user_path(user_two) }
    it { expect(user_one.follows?(user_two)).to_not eq nil }
  end

  describe 'GET #unfollow' do
    let(:user_one) { FactoryGirl.create(:user) }
    let(:user_two) { FactoryGirl.create(:user) }
    before do
      sign_in user_one
      user_one.follow!(user_two)
      get :unfollow, id: user_two.id
    end
    it { should redirect_to user_path(user_two) }
    it { expect(user_one.follows?(user_two)).to eq nil }
  end
end
