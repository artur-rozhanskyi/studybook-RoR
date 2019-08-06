require 'rails_helper'

RSpec.describe 'railway_stations/index', type: :view do
  before do
    assign(:railway_stations, [
             RailwayStation.create!,
             RailwayStation.create!
           ])
  end

  it 'renders a list of railway_stations' do
    render
  end
end
