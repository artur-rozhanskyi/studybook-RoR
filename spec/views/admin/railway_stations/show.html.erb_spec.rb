require 'rails_helper'

RSpec.describe 'admin/railway_stations/show', type: :view do
  before do
    @railway_station = assign(:railway_station, create(:railway_station))
  end

  it 'renders attributes in <p>' do
    render
  end
end
