class Size
  def initialize(value)
    @size_index = @values.index value
  end

  def up
    @size_index < @values.length - 1 ? @size_index += 1 : raise(RangeError, 'Size is out of range')
  end

  def down
    @size_index > 0 ? @size_index -= 1 : raise(RangeError, 'Size is out of range')
  end

  def to_s
    @values[@size_index]
  end
end