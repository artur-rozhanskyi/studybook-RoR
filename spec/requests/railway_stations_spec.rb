require 'rails_helper'

RSpec.describe 'RailwayStations', type: :request do
  describe 'GET /admin/railway_stations' do
    it 'works! (now write some real specs)' do
      get admin_railway_stations_path
      expect(response).to have_http_status(:ok)
    end
  end
end
