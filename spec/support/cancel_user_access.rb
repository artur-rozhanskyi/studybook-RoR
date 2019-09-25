shared_examples_for 'cancel_user_access' do
  context 'when get access to admin' do
    before { log_in(create(:user)) }

    it 'redirects to root path' do
      get :index, params: params, session: session
      expect(response).to redirect_to(root_path)
    end
  end
end
