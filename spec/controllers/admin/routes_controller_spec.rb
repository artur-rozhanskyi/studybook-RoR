require 'rails_helper'

RSpec.describe Admin::RoutesController, type: :controller do
  before { log_in(create(:user, :admin)) }

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
        expect(response).to redirect_to(admin_route_path(Route.last))
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
    let(:railway_station_first) { create(:railway_station) }
    let(:railway_station_last) { create(:railway_station) }
    let(:new_attributes) do
      { railway_station_ids: create_list(:railway_station, 2).map(&:id) }
    end
    let(:js_attribute) { { name: create_list(:railway_station, 2).map(&:name).join(' - ') } }

    context 'with valid params' do
      it 'updates the requested route' do
        put :update, params: { id: route.to_param, route: new_attributes }, session: valid_session
        route.reload
        expect(route.name).to eq("#{railway_station_first.name} - #{railway_station_last.name}")
      end

      it 'redirects to the route' do
        put :update, params: { id: route.to_param, route: valid_attributes }, session: valid_session
        expect(response).to redirect_to(admin_route_path(route))
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

    context 'with js format' do
      it 'updates the requested train' do
        put :update, params: { id: route.to_param, route: js_attribute }, session: valid_session, format: :js
        route.reload
        expect(route.name).to eq(js_attribute[:name])
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
      expect(response).to redirect_to(admin_routes_url)
    end
  end

  it_behaves_like 'cancel_user_access' do
    let(:params) { {} }
    let(:session) { {} }
  end
end
