require 'rails_helper'

RSpec.describe Train, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:train)).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:train, number: nil)).not_to be_valid
  end

  it { expect(build(:train)).to belong_to(:current_station).class_name('RailwayStation').without_validating_presence }
end
