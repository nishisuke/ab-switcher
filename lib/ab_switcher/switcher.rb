module ABSwitcher
  class Switcher
    using NishisukeArray

    HEX_MAX = 15.0
    PATTERN_MAX = 4 # allow abcd test

    attr_reader :sorted_thresholds

    def initialize(ratios)
      if ratios.is_a?(Numeric)
        @sorted_thresholds = calc_major_probability(ratios)
      elsif ratios.is_a?(Array) && ratios.size == 1
        @sorted_thresholds = calc_major_probability(ratios[0])
      elsif ratios.is_a?(Array)
        @sorted_thresholds = calc_probabilities_from_ratios(ratios)
      else
        raise ArgumentError
      end
    end

    def major_hex?(hex_str)
      hex_switch(hex_str).zero?
    end

    def hex_switch(hex_str)
      res = 0
      sorted_thresholds.each.with_index do |threshold, i|
        if hex_probability(hex_str) <= threshold
          res = i
          break
        end
      end

      res
    end

    private

    def calc_major_probability(ratio)
      probability = convert_ratio_into_probability(ratio.to_f)
      major = probability > 0.5 ? probability : 1 - probability
      return major, 1
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

    def calc_probabilities_from_ratios(ratios)
      raise ArgumentError if !ratios.count.between?(2, PATTERN_MAX)

      total = ratios.sum.to_f
      arr = ratios.map { |r| r / total }
      arr.sort! { |a, b| b <=> a }
      arr.cumsum!

      if arr.last < 1
        arr.pop
        arr << 1
      end

      arr
    end
  end
end
