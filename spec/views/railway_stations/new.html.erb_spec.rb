require 'rails_helper'

RSpec.describe 'railway_stations/new', type: :view do
  before do
    assign(:railway_station, RailwayStation.new)
  end

  it 'renders new railway_station form' do
    render

    assert_select 'form[action=?][method=?]', railway_stations_path, 'post' do
    end
  end
end
