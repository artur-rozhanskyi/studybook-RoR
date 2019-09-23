require 'rails_helper'

RSpec.describe Admin::CarriagesController, type: :controller do
  let(:valid_attributes) do
    { bottom_places: 26, upper_places: 26, train_id: create(:train).id }
  end

  let(:invalid_attributes) do
    { bottom_places: '', upper_places: '', type: carriage.class.to_s }
  end

  let(:valid_session) { {} }

  let(:carriage) { create(:coupe, :train) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index, params: { train_id: carriage.train_id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: carriage.to_param, type: carriage.class.to_s }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { train_id: carriage.train_id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: carriage.to_param, train_id: carriage.train_id }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before { carriage }

      it 'creates a new Carriage' do
        expect do
          post :create, params: { carriage: valid_attributes, train_id: carriage.train_id }, session: valid_session
        end.to change(Carriage, :count).by(1)
      end

      it 'redirects to the created carriage' do
        post :create, params: { carriage: valid_attributes, train_id: carriage.train_id }, session: valid_session
        expect(response).to redirect_to(admin_train_path(carriage.train))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { carriage: invalid_attributes, train_id: carriage.train_id }, session: valid_session
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
        put :update, params: { id: carriage.to_param, carriage: new_attributes, train_id: carriage.train_id },
                     session: valid_session
        carriage.reload
        expect(carriage.bottom_places).to eq(new_attributes[:bottom_places])
      end

      it 'redirects to the carriage' do
        put :update, params: { id: carriage.to_param, carriage: valid_attributes, train_id: carriage.train_id },
                     session: valid_session
        expect(response).to redirect_to(admin_carriage_path(carriage.becomes(Carriage)))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        carriage
        put :update, params: { id: carriage.to_param, carriage: invalid_attributes, train_id: carriage.train_id },
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
      expect(response).to redirect_to(admin_train_path(carriage.train))
    end
  end
end
