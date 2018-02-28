require_relative 'test_helper'

class NewApiTest < Minitest::Test
  def test_initialize_with_array
    switcher = ABSwitcher::Switcher.new([1, 2, 3])
    assert_equal 1, switcher.hex_switch('ab41')
  end
end
