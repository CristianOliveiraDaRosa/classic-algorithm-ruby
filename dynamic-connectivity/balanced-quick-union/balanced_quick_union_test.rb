require 'test/unit'
require_relative 'balanced_quick_union'

class BalancedQuickUnionTest < Test::Unit::TestCase
  def setup
    @quick_union = Balanced::QuickUnion.new 10
  end

  # def test_it_should_create_an_array_of_elements_when_initialize
  #   # given
  #   expected = [0,1,2,3,4]
  #   number_of_elements = 5
  #
  #   # when
  #   result = Balanced::QuickUnion.new(number_of_elements)
  #
  #   # then
  #   assert_equal expected, result.elements
  # end
  #
  # def test_it_should_connect_elements
  #   # given
  #   expected = [0,1,2,4,4,5,6,7,8,9]
  #
  #   # when
  #   result = @quick_union.union(3,4).elements
  #
  #   # then
  #   assert_equal expected, result
  # end
  #
  # def test_it_should_connect_number_to_the_root_keeping_the_tree_small
  #   # given
  #   expected = [0,1,2,4,4,5,6,7,4,9]
  #
  #   # when
  #   result = @quick_union.union(3,4)
  #                        .union(8,3).elements
  #
  #   # then
  #   assert_equal expected, result
  # end

  def test_it_should_connect_tree_to_the_root_keeping_the_tree_small
    # given
    expected = [6,2,6,4,4,6,6,2,4,4] #[6,2,6,4,4,6,6,2,4,4]

    # when
    result = @quick_union.union(1,2).union(7,2)
                         .union(0,6).union(5,6)
                         .union(3,4).union(8,4).union(9,4)
                         .union(6,1)
                         .elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_tree_to_the_root_keeping_the_tree_small_
    # given
    expected = [6,2,6,4,6,6,6,2,4,4] #[6,2,6,4,4,6,6,2,4,4]

    # when
    result = @quick_union.union(1,2).union(7,2)
                         .union(0,6).union(5,6)
                         .union(3,4).union(8,4).union(9,4)
                         .union(6,1)
                         .union(7,3)
                         .elements

    # then
    assert_equal expected, result
  end
end
