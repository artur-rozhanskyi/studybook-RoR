require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  let(:valid_session) { {} }

  describe 'GET #show' do
    context 'when request without parameters' do
      it 'returns a success response' do
        get :show, params: {}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  context 'when request with parameters' do
    let(:route) { create(:route, :with_train, :search) }
    let(:starting) { route.railway_stations.first }
    let(:destination) { route.railway_stations.last }

    before do
      route
      get :show, params: { starting: starting, destination: destination }, session: valid_session
    end

    it 'returns a success response' do
      expect(response).to be_successful
    end

    it 'returns hash with route id keys' do
      expect(assigns(:data).keys.include?(route.id)).to be true
    end
  end
end
