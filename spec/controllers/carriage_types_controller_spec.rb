require 'rails_helper'

RSpec.describe CarriageTypesController, type: :controller do
  let(:valid_attributes) do
    { name: 'CarriageType' }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  let(:valid_session) { {} }

  let(:carriage_type) { create(:carriage_type) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: carriage_type.to_param }, session: valid_session
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
      get :edit, params: { id: carriage_type.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Carriage' do
        expect do
          post :create, params: { carriage_type: valid_attributes }, session: valid_session
        end.to change(CarriageType, :count).by(1)
      end

      it 'redirects to the created carriagetype' do
        post :create, params: { carriage_type: valid_attributes }, session: valid_session
        expect(response).to redirect_to(CarriageType.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { carriage_type: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'CarriageType1' }
      end

      it 'updates the requested carriage type' do
        put :update, params: { id: carriage_type.to_param, carriage_type: new_attributes }, session: valid_session
        carriage_type.reload
        expect(carriage_type.name).to eq(new_attributes[:name])
      end

      it 'redirects to the carriage type' do
        put :update, params: { id: carriage_type.to_param, carriage_type: valid_attributes }, session: valid_session
        expect(response).to redirect_to(carriage_type)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        carriage_type
        put :update, params: { id: carriage_type.to_param, carriage_type: invalid_attributes },
                     session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    before { carriage_type }

    it 'destroys the requested carriage type' do
      expect do
        delete :destroy, params: { id: carriage_type.to_param }, session: valid_session
      end.to change(CarriageType, :count).by(-1)
    end

    it 'redirects to the carriage types list' do
      delete :destroy, params: { id: carriage_type.to_param }, session: valid_session
      expect(response).to redirect_to(carriage_types_url)
    end
  end
end
