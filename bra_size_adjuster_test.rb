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

  ##### TEST DDD HANDLING #####

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

  def test_adjusting_band_up_from_36DDD
    adjuster = BraSizeAdjuster.new("36DDD")
    assert_equal "38DD", adjuster.adjust(:band, :up)
  end

  ##### TEST E HANDLING #####

  def test_adjusting_down_cup_from_E
    adjuster = BraSizeAdjuster.new("36E")
    assert_equal "36DD", adjuster.adjust(:cup, :down)
  end

  def test_adjusting_up_cup_from_E
    adjuster = BraSizeAdjuster.new("34E")
    assert_equal "34F", adjuster.adjust(:cup, :up)
  end

  def test_adjusting_band_down_from_36E
    adjuster = BraSizeAdjuster.new("36E")
    assert_equal "34F", adjuster.adjust(:band, :down)
  end

  def test_adjusting_band_up_from_36E
    adjuster = BraSizeAdjuster.new("36E")
    assert_equal "38DD", adjuster.adjust(:band, :up)
  end

  def test_adjusting_down_cup_to_E
    adjuster = BraSizeAdjuster.new("36F")
    assert_equal "36E", adjuster.adjust(:cup, :down)
  end

  def test_adjusting_up_cup_to_E
    adjuster = BraSizeAdjuster.new("34DD")
    assert_equal "34E", adjuster.adjust(:cup, :up)
  end

  def test_adjusting_band_down_to_36E
    adjuster = BraSizeAdjuster.new("38DD")
    assert_equal "36E", adjuster.adjust(:band, :down)
  end

  def test_adjusting_band_up_to_36E
    adjuster = BraSizeAdjuster.new("34F")
    assert_equal "36E", adjuster.adjust(:band, :up)
  end

  ##### TESTING OUT-OF-RANGE #####

  def test_adjusting_band_up_from_40F
    adjuster = BraSizeAdjuster.new("40F")
    assert_raises RangeError do
      adjuster.adjust(:band, :up)
    end
  end

  def test_adjusting_band_down_from_32A
    adjuster = BraSizeAdjuster.new("32A")
    assert_raises RangeError do
      adjuster.adjust(:band, :down)
    end
  end

  def test_adjusting_cup_up_from_40F
    adjuster = BraSizeAdjuster.new("40F")
    assert_raises RangeError do
      adjuster.adjust(:cup, :up)
    end
  end

  def test_adjusting_cup_down_from_32A
    adjuster = BraSizeAdjuster.new("32A")
    assert_raises RangeError do
      adjuster.adjust(:cup, :down)
    end
  end
end
