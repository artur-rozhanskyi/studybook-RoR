require 'rails_helper'

RSpec.describe 'admin/railway_stations/index', type: :view do
  let(:valid_attributes) do
    { name: 'Station' }
  end

  before do
    assign(:railway_stations, [
             create(:railway_station),
             create(:railway_station)
           ])
  end

  it 'renders a list of railway_stations' do
    render
  end
end
