require 'rails_helper'

RSpec.describe 'trains/new', type: :view do
  before do
    assign(:train, Train.new(
                     number: 'MyString'
                   ))
  end

  it 'renders new train form' do
    render

    assert_select 'form[action=?][method=?]', trains_path, 'post' do
      assert_select 'input[name=?]', 'train[number]'
    end
  end
end
