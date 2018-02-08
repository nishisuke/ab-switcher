require_relative 'test_helper'

class ABSwitcherTest < Minitest::Test
  def test_to_return_bool_when_hex
    switcher = ABSwitcher::Switcher.new(0.3)
    hex = '321ab321'
    res = switcher.hex_switch(hex)
    assert_includes [true, false], res
  end
end
