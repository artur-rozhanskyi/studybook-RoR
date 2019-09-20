require 'rails_helper'

RSpec.describe Carriage, type: :model do
  let(:carriage) { create(:coupe, :train) }

  xit { expect(carriage).to belong_to(:carriage_type) }
  it { expect(carriage).to belong_to(:train) }

  describe '#set_number' do
    context 'when train carriages empty' do
      it 'returns number eq 1' do
        expect(carriage.number).to eq(1)
      end
    end

    context 'when train carriages not empty' do
      let(:carriage_train_with_carriages) { create(:coupe, :train_with_carriages) }

      it 'returns number greater then max by 1' do
        max_number = carriage_train_with_carriages.train.carriages.pluck(:number).compact.max
        expect(carriage_train_with_carriages.number).to eq(max_number)
      end
    end
  end
end
