require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Admin::TrainsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Train. As you add validations to Train, be sure to
  # adjust the attributes here as well.
  before { log_in(create(:user, :admin)) }

  let(:valid_attributes) do
    { number: '12345', current_station_id: create(:railway_station).id, routes: [create(:route)] }
  end

  let(:invalid_attributes) do
    { number: nil,  current_station_id: create(:railway_station).id }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TrainsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:train) { create(:train) }

  describe 'GET #index' do
    it 'returns a success response' do
      Train.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: train.to_param }, session: valid_session
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
      get :edit, params: { id: train.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Train' do
        expect do
          post :create, params: { train: valid_attributes }, session: valid_session
        end.to change(Train, :count).by(1)
      end

      it 'redirects to the created train' do
        post :create, params: { train: valid_attributes }, session: valid_session
        expect(response).to redirect_to(admin_train_path(Train.last))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { train: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { number: 'Train2', current_station_id: create(:railway_station).id, routes: [create(:route)] }
      end

      it 'updates the requested train' do
        put :update, params: { id: train.to_param, train: new_attributes }, session: valid_session
        train.reload
        expect(train.number).to eq(new_attributes[:number])
      end

      it 'redirects to the train' do
        put :update, params: { id: train.to_param, train: valid_attributes }, session: valid_session
        expect(response).to redirect_to(admin_train_path(train))
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: train.to_param, train: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    before { train }

    it 'destroys the requested train' do
      expect do
        delete :destroy, params: { id: train.to_param }, session: valid_session
      end.to change(Train, :count).by(-1)
    end

    it 'redirects to the trains list' do
      delete :destroy, params: { id: train.to_param }, session: valid_session
      expect(response).to redirect_to(admin_trains_url)
    end
  end

  it_behaves_like 'cancel_user_access' do
    let(:params) { {} }
    let(:session) { {} }
  end
end
