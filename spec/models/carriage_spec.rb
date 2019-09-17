require 'rails_helper'

RSpec.describe Carriage, type: :model do
  let(:carriage) { create(:coupe) }

  xit { expect(carriage).to belong_to(:carriage_type) }
  it { expect(carriage).to belong_to(:train) }
end
