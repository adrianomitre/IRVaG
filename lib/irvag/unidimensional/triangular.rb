$:.unshift File.join(File.dirname(__FILE__), '..')

require 'unidimensional'

module IRVaG

  module Unidimensional

    class Triangular

      include Unidimensional

      attr_accessor :max_half_amp, :mean
      attr_reader :variance

      def variance=(var)
        @max_half_amp = Math::sqrt(var * 18 / 3.0)
      end

      def next
        x = rand() + rand() - 1
        @mean + x * @max_half_amp
      end

    end

  end

end
