shared_examples_for 'status_ok' do |path|
  it 'returns :ok status by admin login' do
    get public_send path
    expect(response).to have_http_status(:ok)
  end
end
