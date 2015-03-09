require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #new' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { sign_in user }
    before do
      get :new, user_id: user.id
    end
    it { should respond_with :ok }
    it { should render_template :form }
    it { expect(assigns(:post).user_id).to eq user.id }
  end

  describe 'POST #create' do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { sign_in user }
    before do
      post :create, user_id: user.id, post: FactoryGirl.attributes_for(:post)
    end
    it { should redirect_to root_path }
  end
end
