require 'rails_helper'

RSpec.describe Route, type: :model do
  it 'is valid with valid attributes' do
    expect(build(:route)).to be_valid
  end

  it 'is invalid with invalid attributes' do
    expect(build(:route, name: nil)).not_to be_valid
  end
end
