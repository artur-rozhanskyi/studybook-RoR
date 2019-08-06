require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  describe 'GET /trains' do
    it 'works! (now write some real specs)' do
      get trains_path
      expect(response).to have_http_status(:ok)
    end
  end
end
