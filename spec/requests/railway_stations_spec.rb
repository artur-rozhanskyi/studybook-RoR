require 'rails_helper'

RSpec.describe 'RailwayStations', type: :request do\
  let(:admin) { create(:user, :admin) }

  describe 'GET /admin/railway_stations' do
    before { login_as admin }

    it_behaves_like 'status_ok', :admin_railway_stations_path
  end
end
