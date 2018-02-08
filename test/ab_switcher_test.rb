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
    hex = 'b21ab321'
    assert_equal false, @switcher.hex_switch(hex)
  end

  def test_minor_probability
    hex = 'a21ab321'
    assert_equal true, @switcher.hex_switch(hex)
  end

  def test_switch_with_empty
    assert_equal false, @switcher.hex_switch('')
  end

  def test_switch_with_nil
    assert_equal false, @switcher.hex_switch(nil)
  end

  def test_initialize_with_minor
    switcher = ABSwitcher::Switcher.new(0.43)
    assert_equal 0.57, switcher.major_probability.round(2)
  end

  def test_initialize_with_two_ratio
    switcher = ABSwitcher::Switcher.new(3, 10)
    assert_equal 0.77, switcher.major_probability.round(2)
  end

  def test_major_value
    switcher = ABSwitcher::Switcher.new(3, major: 3)
    hex = '021ab321'
    assert_equal 3, switcher.hex_switch(hex)
  end

  def test_minor_value
    switcher = ABSwitcher::Switcher.new(3, minor: 'hoge')
    hex = 'f21ab321'
    assert_equal 'hoge', switcher.hex_switch(hex)
  end
end
