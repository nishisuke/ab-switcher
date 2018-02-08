module ABSwitcher
  class Switcher
    HEX_MAX = 15.0

    attr_reader :major_float, :minor_float, :major_value, :minor_value

    def initialize(minor_float)
      @major_float, @minor_float = 1 - minor_float, minor_float
      @major_value, @minor_value = true, false
    end

    def hex_switch(hex_str)
      int = hex_str[0].hex rescue HEX_MAX
      flt = int / HEX_MAX

      if flt >= minor_float
        major_value
      else
        minor_value
      end
    end
  end
end
