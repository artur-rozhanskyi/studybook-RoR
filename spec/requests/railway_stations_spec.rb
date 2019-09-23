require 'rails_helper'

RSpec.describe 'RailwayStations', type: :request do\
  let(:admin) { create(:user, :admin) }

  describe 'GET /admin/railway_stations' do
    before { login_as admin }

    it 'returns :ok status  by admin login' do
      get admin_railway_stations_path
      expect(response).to have_http_status(:ok)
    end
  end
end
