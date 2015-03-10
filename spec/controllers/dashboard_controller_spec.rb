require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET #index' do
    context 'when a user is signed in' do
      let(:user) { FactoryGirl.create(:user) }
      let(:post_one) { FactoryGirl.create(:post, created_at: Time.current) }
      let(:post_two) { FactoryGirl.create(:post, created_at: 1.hour.ago) }
      let(:post_three) { FactoryGirl.create(:post, created_at: 2.hours.ago) }
      let(:unfollowed_post) { FactoryGirl.create(:post) }
      before do
        sign_in user
        user.follow!(post_one.user)
        user.follow!(post_two.user)
        user.follow!(post_three.user)
        get :index
      end
      it { should respond_with :ok }
      it { should render_template :index }
      it { expect(assigns(:posts)).to eq [post_one, post_two, post_three] }
      it { expect(assigns(:posts)).to_not include unfollowed_post }
    end
    context 'when a user is not signed in' do
      before do
        get :index
      end
      it { should respond_with :ok }
      it { should render_template :index }
      it { expect(assigns(:posts)).to eq nil }
    end
  end

  describe 'GET #index' do
    let(:user) { FactoryGirl.create(:user) }
    let(:post_one) { FactoryGirl.create(:post, created_at: Time.current) }
    let(:post_two) { FactoryGirl.create(:post, created_at: 1.hour.ago) }
    let(:post_three) { FactoryGirl.create(:post, created_at: 2.hours.ago) }
    let(:unfollowed_post) { FactoryGirl.create(:post, created_at: 3.hours.ago) }
    before do
      sign_in user
      user.follow!(post_one.user)
      user.follow!(post_two.user)
      user.follow!(post_three.user)
      get :public
    end
    it { should respond_with :ok }
    it { should render_template :public }
    it { expect(assigns(:posts)).to eq [post_one, post_two, post_three, unfollowed_post] }
  end
end
