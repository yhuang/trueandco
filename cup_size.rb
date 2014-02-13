require_relative 'size'

class CupSize < Size
  def initialize(raw_value)
    @values     = %w(A B C D DD E F)
    super convert_DDD_to_E(raw_value)
  end

  def convert_DDD_to_E(raw_value)
    raw_value == 'DDD' ? 'E' : raw_value
  end
end