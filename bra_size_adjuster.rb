require_relative 'band_size'
require_relative 'cup_size'

class BraSizeAdjuster
  def initialize(size)
    match_data = size.match /(\d+)([A-Z]+)/
    @band_size = BandSize.new match_data[1]
    @cup_size  = CupSize.new match_data[2]
  end

  def adjust(type, direction)
    case type
      when :band
        apply_band_rules(direction)
      when :cup
        apply_cup_rules(direction)
    end

    "#{@band_size}#{@cup_size}"
  end

  private

  def apply_band_rules(direction)
    (@cup_size.down if @band_size.up) if direction == :up
    (@cup_size.up if @band_size.down) if direction == :down
  end

  def apply_cup_rules(direction)
    @cup_size.up if direction == :up
    @cup_size.down if direction == :down
  end
end
