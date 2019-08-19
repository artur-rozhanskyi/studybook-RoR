require 'rails_helper'

RSpec.describe Route, type: :model do
  let(:route) { create(:route) }

  it 'is valid with valid attributes' do
    expect(route).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:route, railway_stations: [create(:railway_station)])).not_to be_valid
  end

  it { expect(route).to have_many(:railway_stations) }

  it { expect(route).to have_and_belong_to_many(:trains) }
end
