module ABSwitcher
  class Switcher
    attr_reader :major_float, :minor_float

    def initialize(minor_rate)
      @minor_float, @major_float = minor_rate, 1 - minor_rate
    end

    def hex_switch(hex)
      true
    end
  end
end
