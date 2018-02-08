module ABSwitcher
  class Switcher
    HEX_MAX = 15.0

    attr_reader :major_probability, :major_value, :minor_value

    def initialize(ratio, another_ratio = nil, major: true, minor: false)
      @major_probability = calc_major_probability(ratio, another_ratio)
      @major_value, @minor_value = major, minor
    end

    def hex_switch(hex_str)
      hex = hex_str[0].hex rescue HEX_MAX
      flt = hex / HEX_MAX

      if flt <= major_probability
        major_value
      else
        minor_value
      end
    end

    private

    def calc_major_probability(ratio, another_ratio = nil)
      ratio = ratio.to_f

      probability = if another_ratio.nil?
        convert_ratio_into_probability(ratio)
      else
        calc_probability(ratio, another_ratio)
      end

      probability > 0.5 ? probability : 1 - probability
    end

    def convert_ratio_into_probability(ratio)
      if ratio.between?(1, 100)
        # 1 goes here
        ratio / 100
      elsif ratio.between?(0, 1)
        ratio
      else
        # TODO handle
        raise DOUSHIYOU
      end
    end

    def calc_probability(ratio, another_ratio)
      ratio / (ratio + another_ratio)
    end
  end
end
