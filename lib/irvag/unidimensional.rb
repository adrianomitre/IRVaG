module IRVaG

  module Unidimensional

    DefaultStdDev = 1.0
    DefaultMean = 0.0

    def initialize(sd=DefaultStdDev, mean=DefaultMean)
      self.std_dev=(sd)
      self.mean=(mean)
    end

    def std_dev=(sd)
      self.variance=(sd*sd)
    end

    def std_dev(sd)
      Math::sqrt(self.variance)
    end

    def variance=(sd)
      self.std_dev=(Math::sqrt(sd))
    end

  end

end
