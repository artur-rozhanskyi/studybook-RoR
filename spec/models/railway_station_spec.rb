require 'rails_helper'

RSpec.describe RailwayStation, type: :model do
  let(:railway_station) { build :railway_station }

  it 'is valid with valid attributes' do
    expect(railway_station).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:railway_station, name: nil)).not_to be_valid
  end

  it { expect(railway_station).to have_many(:routes) }
end
