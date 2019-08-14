require 'rails_helper'

RSpec.describe CarriagesController, type: :controller do
  let(:valid_attributes) do
    { bottom_places: 26, upper_places: 26, carriage_type_id: create(:carriage_type).id, train_id: create(:train).id }
  end

  let(:invalid_attributes) do
    { bottom_places: nil, upper_places: nil }
  end

  let(:valid_session) { {} }

  let(:carriage) { create(:carriage) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: carriage.to_param }, session: valid_session
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
      get :edit, params: { id: carriage.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Carriage' do
        expect do
          post :create, params: { carriage: valid_attributes }, session: valid_session
        end.to change(Carriage, :count).by(1)
      end

      it 'redirects to the created carriage' do
        post :create, params: { carriage: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Carriage.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { carriage: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { bottom_places: 1 }
      end

      it 'updates the requested carriage' do
        put :update, params: { id: carriage.to_param, carriage: new_attributes }, session: valid_session
        carriage.reload
        expect(carriage.bottom_places).to eq(new_attributes[:bottom_places])
      end

      it 'redirects to the carriage' do
        put :update, params: { id: carriage.to_param, carriage: valid_attributes }, session: valid_session
        expect(response).to redirect_to(carriage)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        carriage
        put :update, params: { id: carriage.to_param, carriage: invalid_attributes },
                     session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    before { carriage }

    it 'destroys the requested carriage' do
      expect do
        delete :destroy, params: { id: carriage.to_param }, session: valid_session
      end.to change(Carriage, :count).by(-1)
    end

    it 'redirects to the carriages list' do
      delete :destroy, params: { id: carriage.to_param }, session: valid_session
      expect(response).to redirect_to(carriages_url)
    end
  end
end
