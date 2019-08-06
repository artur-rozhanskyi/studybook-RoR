require 'rails_helper'

RSpec.describe 'railway_stations/show', type: :view do
  before do
    @railway_station = assign(:railway_station, RailwayStation.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
