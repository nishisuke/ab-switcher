module ABSwitcher
  class Switcher
    HEX_MAX = 15.0

    attr_reader :major_probability

    def initialize(ratio)
      @major_probability = calc_major_probability(ratio)
    end

    def major_hex?(hex_str)
      hex_probability(hex_str) <= major_probability
    end

    private

    def calc_major_probability(ratio)
      probability = convert_ratio_into_probability(ratio.to_f)
      probability > 0.5 ? probability : 1 - probability
    end

    def convert_ratio_into_probability(ratio)
      if ratio.between?(0, 1)
        ratio
      else
        # TODO handle
        raise NotImplementedError
      end
    end

    def hex_probability(hex_str)
      # switch by first char
      hex = hex_str[0].hex rescue 0
      hex / HEX_MAX
    end
  end
end
