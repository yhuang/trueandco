require_relative 'size'

class CupSize < Size
  def initialize(value)
    @values     = %w(A B C D DD DDD F)
    super value
  end
end