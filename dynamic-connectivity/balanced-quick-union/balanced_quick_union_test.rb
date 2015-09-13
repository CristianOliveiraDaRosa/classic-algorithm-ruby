require 'test/unit'
require_relative 'balanced_quick_union'

class BalancedQuickUnionTest < Test::Unit::TestCase
  def setup
    @quick_union = Balanced::QuickUnion.new 10
  end

  def test_it_should_create_an_array_of_elements_when_initialize
    # given
    expected = [0,1,2,3,4]
    number_of_elements = 5

    # when
    result = Balanced::QuickUnion.new(number_of_elements)

    # then
    assert_equal expected, result.elements
  end

  def test_it_should_connect_elements
    # given
    expected = [0,1,2,4,4,5,6,7,8,9]

    # when
    result = @quick_union.union(3,4).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_number_8_to_4_to_keep_tree_small
    # given
    expected = [0,1,2,4,4,5,6,7,4,9]

    # when
    result = @quick_union.union(3,4)
                         .union(8,3).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_number_1_to_4_to_keep_tree_small
    # given
    expected = [0,4,2,4,4,5,6,7,4,9]

    # when
    result = @quick_union.union(3,4)
                         .union(8,3)
                         .union(1,8).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_tree_to_the_root_keeping_the_tree_small
    assert_equal [0,1,2,4,4,5,6,7,8,9], @quick_union.union(4,3).elements
    assert_equal [0,1,2,4,4,5,6,7,4,9], @quick_union.union(3,8).elements
    assert_equal [0,1,2,4,4,6,6,7,4,9], @quick_union.union(6,5).elements
    assert_equal [0,1,2,4,4,6,6,7,4,4], @quick_union.union(4,9).elements
    assert_equal [0,2,2,4,4,6,6,7,4,4], @quick_union.union(2,1).elements
    assert_equal [6,2,2,4,4,6,6,7,4,4], @quick_union.union(5,0).elements
    assert_equal [6,2,2,4,4,6,6,2,4,4], @quick_union.union(7,2).elements
    assert_equal [6,2,6,4,4,6,6,2,4,4], @quick_union.union(6,1).elements
    assert_equal [6,2,6,4,6,6,6,2,4,4], @quick_union.union(7,3).elements
  end
end
