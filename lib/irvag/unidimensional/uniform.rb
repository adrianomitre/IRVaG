$:.unshift File.join(File.dirname(__FILE__), '..')

require 'unidimensional'

module IRVaG

  module Unidimensional

    class Uniform

      include Unidimensional

      attr_accessor :max_half_amp, :integer_values_only, :mean
      attr_reader :variance

      def variance=(var)
        @max_half_amp = Math::sqrt(var * 12) / 2
      end

      def next
        if integer_values_only
          z = rand(@max_half_amp*2+1)-@max_half_amp
        else
          z = (rand() - 0.5) * 2.0 * @max_half_amp
        end
        @mean + z
      end

    end

  end

end
