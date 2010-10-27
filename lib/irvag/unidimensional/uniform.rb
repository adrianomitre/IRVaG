$:.unshift File.join(File.dirname(__FILE__), '..')

require 'unidimensional'

module IRVaG

  module Unidimensional

    class Uniform

      include Unidimensional

      attr_accessor :max_half_amp, :mean
      attr_reader :variance

      def variance=(var)
        @max_half_amp = Math::sqrt(var * 12) / 2
      end

      def next
        x = (rand() - 0.5) * 2.0 * @max_half_amp
        @mean + x
      end

    end

  end

end
