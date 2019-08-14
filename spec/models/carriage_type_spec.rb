require 'rails_helper'

RSpec.describe CarriageType, type: :model do
  let(:carriage_type) { build :carriage_type }

  it { expect(carriage_type).to have_many(:carriages) }
end
