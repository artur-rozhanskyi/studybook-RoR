require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  let(:admin) { create(:user, :admin) }

  describe 'GET /admin/trains' do
    before { login_as admin }

    it 'returns :ok status by admin login' do
      get admin_trains_path
      expect(response).to have_http_status(:ok)
    end
  end
end
