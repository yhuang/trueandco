require 'minitest/autorun'

require_relative 'bra_size_adjuster'

class BraSizeAdjusterTest < MiniTest::Unit::TestCase
  def test_adjusting_up_band_size_from_34_to_36
    adjuster = BraSizeAdjuster.new("34C")
    assert_equal "36B", adjuster.adjust(:band, :up)
  end

  def test_adjusting_down_band_size_from_34_to_32
    adjuster = BraSizeAdjuster.new("34C")
    assert_equal "32D", adjuster.adjust(:band, :down)
  end

  def test_adjusting_down_cup_from_DDD
    adjuster = BraSizeAdjuster.new("36DDD")
    assert_equal "36DD", adjuster.adjust(:cup, :down)
  end

  def test_adjusting_up_cup_from_DDD
    adjuster = BraSizeAdjuster.new("34DDD")
    assert_equal "34F", adjuster.adjust(:cup, :up)
  end

  def test_adjusting_band_down_from_36DDD
    adjuster = BraSizeAdjuster.new("36DDD")
    assert_equal "34F", adjuster.adjust(:band, :down)
  end

  ##### ADDITIONAL TESTS #####

  def test_adjusting_band_up_from_40F
    adjuster = BraSizeAdjuster.new("40F")
    assert_equal "40F", adjuster.adjust(:band, :up)
  end

  def test_adjusting_band_down_from_32A
    adjuster = BraSizeAdjuster.new("32A")
    assert_equal "32A", adjuster.adjust(:band, :down)
  end

  def test_adjusting_cup_up_from_40F
    adjuster = BraSizeAdjuster.new("40F")
    assert_equal "40F", adjuster.adjust(:band, :up)
  end

  def test_adjusting_cup_down_from_32A
    adjuster = BraSizeAdjuster.new("32A")
    assert_equal "32A", adjuster.adjust(:band, :down)
  end
end
