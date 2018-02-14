require 'ab_switcher/version'
require 'ab_switcher/switcher'

module ABSwitcher
  class << self
    def major_hex?(ratio, hex_str)
      ABSwitcher::Switcher.new(ratio).major_hex?(hex_str)
    end
  end
end
