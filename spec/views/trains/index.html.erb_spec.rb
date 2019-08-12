require 'rails_helper'

RSpec.describe 'trains/index', type: :view do
  before do
    assign(:trains, [create(:train), create(:train)])
  end

  it 'renders a list of trains' do
    render
    assert_select 'tr>td', text: 'Number'.to_s, count: 2
  end
end
