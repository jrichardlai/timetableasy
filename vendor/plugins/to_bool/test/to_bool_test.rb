RAILS_ENV = 'test'
require 'test/unit'
require 'to_bool'

class ToBoolTest < Test::Unit::TestCase
  def test_should_return_true
    assert_equal true, 'true'.to_bool
    assert_equal true, 'TrUe'.to_bool
    assert_equal true, true.to_bool
    assert_equal true, 1.to_bool
  end

  def test_should_return_false
    assert_equal false, nil.to_bool
    assert_equal false, 'false'.to_bool
    assert_equal false, 'FaLsE'.to_bool
    assert_equal false, false.to_bool
    assert_equal false, 0.to_bool
  end

  def test_should_raise_exception
    assert_raise(ArgumentError) { 'true '.to_bool }
    assert_raise(ArgumentError) { ' true'.to_bool }
    assert_raise(ArgumentError) { ' true '.to_bool }
    assert_raise(ArgumentError) { 'false '.to_bool }
    assert_raise(ArgumentError) { ' false'.to_bool }
    assert_raise(ArgumentError) { ' false '.to_bool }
    assert_raise(ArgumentError) { 'BLAH'.to_bool }
  end
end
