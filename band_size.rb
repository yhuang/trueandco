require_relative 'size'

class BandSize < Size
  def initialize(value)
    @values     = %w(32 34 36 38 40)
    super value
  end
end