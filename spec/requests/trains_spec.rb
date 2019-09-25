require 'rails_helper'

RSpec.describe 'Trains', type: :request do
  let(:admin) { create(:user, :admin) }

  describe 'GET /admin/trains' do
    before { login_as admin }

    it_behaves_like 'status_ok', :admin_trains_path
  end
end
