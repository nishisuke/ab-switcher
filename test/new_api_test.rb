require_relative 'test_helper'

class NewApiTest < Minitest::Test
  def test_initialize_with_array
    assert_equal :minor, ABSwitcher.hex_switch('ab41', 1 , 2, 3)
  end
end
