require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET #index' do
    before do
      get :index
    end
    it { should respond_with :ok }
    it { should render_template :index }
  end
end
