require 'rails_helper'

RSpec.describe 'trains/show', type: :view do
  before do
    @train = assign(:train, Train.create!(
                              number: 'Number'
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Number/)
  end
end
