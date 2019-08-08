require 'rails_helper'

RSpec.describe RailwayStation, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:railway_station)).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:railway_station, name: nil)).not_to be_valid
  end
end
