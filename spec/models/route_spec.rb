require 'rails_helper'

RSpec.describe Route, type: :model do
  let(:route) { build(:route) }

  it 'is valid with valid attributes' do
    expect(route).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:route, name: nil)).not_to be_valid
  end

  it { expect(route).to have_many(:railway_stations) }
end
