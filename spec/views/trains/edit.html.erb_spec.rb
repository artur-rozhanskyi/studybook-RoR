require 'rails_helper'

RSpec.describe 'trains/edit', type: :view do
  let!(:train) { Train.create! }

  before { assign(:train, train) }

  it 'renders the edit train form' do
    render

    assert_select 'form[action=?][method=?]', train_path(train), 'post' do
      assert_select 'input[name=?]', 'train[number]'
    end
  end
end
