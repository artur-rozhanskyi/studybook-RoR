require 'rails_helper'

RSpec.describe Admin::WelcomeController, type: :controller do
  before { log_in(create(:user, :admin)) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
