require 'rails_helper'

RSpec.describe Train, type: :model do
  let(:train) { create(:train) }

  it 'is valid with valid attributes' do
    expect(build(:train)).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:train, number: nil)).not_to be_valid
  end

  it { expect(train).to belong_to(:current_station).class_name('RailwayStation').without_validating_presence }

  it { expect(train).to belong_to(:route).without_validating_presence }
end
