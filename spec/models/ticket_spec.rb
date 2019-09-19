require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { create(:ticket) }

  it { expect(ticket).to belong_to(:train) }

  it { expect(ticket).to belong_to(:first_station).class_name('RailwayStation') }

  it { expect(ticket).to belong_to(:last_station).class_name('RailwayStation') }

  it { expect(ticket).to belong_to(:user) }
end
