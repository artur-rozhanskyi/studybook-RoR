require 'rails_helper'

RSpec.describe RoutesController, type: :controller do
  let(:valid_attributes) do
    { railway_station_ids: [create(:railway_station).id, create(:railway_station).id] }
  end

  let(:invalid_attributes) do
    { railway_station_ids: [create(:railway_station).id] }
  end

  let(:valid_session) { {} }

  let(:route) { create(:route) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: route.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: route.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Route' do
        expect do
          post :create, params: { route: valid_attributes }, session: valid_session
        end.to change(Route, :count).by(1)
      end

      it 'redirects to the created route' do
        post :create, params: { route: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Route.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { route: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:railway_station_first) { create(:railway_station) }      
      let(:railway_station_last) { create(:railway_station) }
      let(:new_attributes) do
        { railway_station_ids: [create(:railway_station).id, create(:railway_station).id] }
      end

      it 'updates the requested route' do
        put :update, params: { id: route.to_param, route: new_attributes }, session: valid_session
        route.reload
        expect(route.name).to eq("#{railway_station_first.name} - #{railway_station_last.name}")
      end

      it 'redirects to the route' do
        put :update, params: { id: route.to_param, route: valid_attributes }, session: valid_session
        expect(response).to redirect_to(route)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        route
        put :update, params: { id: route.to_param, route: invalid_attributes },
                     session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    before { route }

    it 'destroys the requested route' do
      expect do
        delete :destroy, params: { id: route.to_param }, session: valid_session
      end.to change(Route, :count).by(-1)
    end

    it 'redirects to the routes list' do
      delete :destroy, params: { id: route.to_param }, session: valid_session
      expect(response).to redirect_to(routes_url)
    end
  end
end
