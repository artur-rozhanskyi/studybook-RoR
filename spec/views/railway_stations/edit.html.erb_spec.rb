require 'rails_helper'

RSpec.describe 'railway_stations/edit', type: :view do
  let(:valid_attributes) do
    { name: 'Station' }
  end

  let!(:railway_station) { RailwayStation.create! valid_attributes }

  before { assign(:railway_station, railway_station) }

  it 'renders the edit railway_station form' do
    render

    assert_select 'form[action=?][method=?]', railway_station_path(railway_station), 'post' do
    end
  end
end
