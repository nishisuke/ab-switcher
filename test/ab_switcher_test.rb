require_relative 'test_helper'

class ABSwitcherTest < Minitest::Test
  def setup
    @switcher = ABSwitcher::Switcher.new(0.3)
  end

  def test_to_return_bool_when_hex
    hex = '321ab321'
    res = @switcher.hex_switch(hex)
    assert_includes [true, false], res
  end

  def test_reproducibility
    hex = '321ab321'
    assert @switcher.hex_switch(hex) == @switcher.hex_switch(hex)
  end

  def test_major_probability
    hex = '521ab321'
    assert_equal true, @switcher.hex_switch(hex)
  end

  def test_minor_probability
    hex = '421ab321'
    assert_equal false, @switcher.hex_switch(hex)
  end
end
