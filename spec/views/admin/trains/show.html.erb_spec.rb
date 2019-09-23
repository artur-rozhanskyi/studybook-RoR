require 'rails_helper'

RSpec.describe 'admin/trains/show', type: :view do
  before do
    @train = assign(:train, create(:train))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Number/)
  end
end
