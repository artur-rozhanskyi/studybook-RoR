require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let(:user) { create(:user) }

  let(:valid_session) { {} }
  let(:ticket) { create(:ticket) }

  let(:starting) { create(:railway_station) }
  let(:destination) { create(:railway_station) }
  let(:train) { create(:train) }
  let(:time) { DateTime.now }
  let(:valid_attributes) do
    { last_station_id: destination.id,
      first_station_id: starting.id,
      train_id: train.id,
      arrival: time,
      destination: time,
      name: Faker::Name.unique.name,
      middle_name: Faker::Name.unique.name,
      last_name: Faker::Name.unique.name,
      passport: Faker::Name.unique.name,
      user_id: user.id }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: ticket.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { ticket: valid_attributes }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Ticket' do
        expect do
          post :create, params: { ticket: valid_attributes }, session: valid_session
        end.to change(Ticket, :count).by(1)
      end

      it 'redirects to the created railway_station' do
        post :create, params: { ticket: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Ticket.last)
      end
    end
  end
end
