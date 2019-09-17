require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'is valid with valid attributes' do
    expect(build(:user)).to be_valid
  end

  xit { expect(user).to have_many(:tickets) }
end
