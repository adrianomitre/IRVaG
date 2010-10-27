$:.unshift File.join(File.dirname(__FILE__), '..')

require 'unidimensional'

module IRVaG

  module Unidimensional

    class Gaussian

      include Unidimensional

      attr_accessor :std_dev, :mean

      # Implement the Box-Muller transform to generate a pair of independent
      # standard normally distributed (zero expectation, unit variance) random numbers.
      #
      # More info at http://en.wikipedia.org/wiki/Box-Muller_transform
      #
      def self.box_muller
        u1, u2 = rand, rand
        k = Math::sqrt(-2*Math::log(u1))
        z1 = k * Math::cos(2 * Math::PI * u2)
        z2 = k * Math::sin(2 * Math::PI * u2)
        [z1, z2]
      end

      # Implement the Marsaglia polar method generate a pair of independent
      # standard normally distributed (zero expectation, unit variance) random numbers.
      #
      # More info at http://en.wikipedia.org/wiki/Marsaglia_polar_method
      #
      def self.marsaglia
        x, y = 1, 1 # for scope
        begin
          x, y = rand*2-1, rand*2-1
          s = x*x + y*y
        end until s < 1
        k = Math::sqrt(-2*Math::log(s)/s)
        [x*k, y*k]
      end

      def next
        z = self.class.marsaglia.first
        @mean + z * @std_dev
      end

    end

  end

end
