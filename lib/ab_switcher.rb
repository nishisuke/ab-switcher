require 'nishisuke_array'

require 'ab_switcher/version'
require 'ab_switcher/switcher'

module ABSwitcher
  class << self
    def major_hex?(hex_str, *ratios)
      ABSwitcher::Switcher.new(ratios).major_hex?(hex_str)
    end
  end
end
