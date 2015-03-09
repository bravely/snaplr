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
end
