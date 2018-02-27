require_relative 'test_helper'

class ABSwitcherTest < Minitest::Test
  def setup
    @switcher = ABSwitcher::Switcher.new(0.3)
  end

  def test_reproducibility
    hex = '321ab321'
    assert @switcher.major_hex?(hex) == @switcher.major_hex?(hex)
  end

  def test_minor_hex
    hex = 'b21ab321'
    assert_equal false, @switcher.major_hex?(hex)
  end

  def test_major_hex
    hex = 'a21ab321'
    assert_equal true, @switcher.major_hex?(hex)
  end

  def test_major_with_empty
    assert_equal true, @switcher.major_hex?('')
  end

  def test_major_with_nil
    assert_equal true, @switcher.major_hex?(nil)
  end

  def test_alias
    assert ABSwitcher.major_hex?('a21a', 0.3)
  end
end
