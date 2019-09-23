require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  describe 'GET /admin/trains' do
    it 'works! (now write some real specs)' do
      get admin_trains_path
      expect(response).to have_http_status(:ok)
    end
  end
end
