require 'test/unit'
require_relative 'quick_union'

class QuickUnionTest < Test::Unit::TestCase
  def setup
    @quick_union = QuickUnion.new 10
  end

  def test_it_should_create_an_array_of_elements_when_initialize
    # given
    expected = [0,1,2,3,4]
    number_of_elements = 5

    # when
    result = QuickUnion.new(number_of_elements)

    # then
    assert_equal expected, result.elements
  end

  def test_it_should_connect_numbers_first_with_second
    # given
    expected = [0,1,9,3,4,5,6,7,8,9]

    # when
    result = @quick_union.union(2,9).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_numbers_with_its_tree
    # given
    expected = [0,1,9,4,9,6,6,7,8,9]

    # when
    result = @quick_union.union(2,9)
                         .union(3,4)
                         .union(4,9)
                         .union(5,6).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_the_trees
    # given
    expected = [0,1,9,4,9,6,6,7,8,6]

    # when
    result = @quick_union.union(2,9)
                         .union(3,4)
                         .union(4,9)
                         .union(5,6)
                         .union(9,6).elements

    # then
    assert_equal expected, result
  end


  def test_it_should_connect_with_the_root_of_the_tree
    # given
    expected = [0,1,2,8,3,5,5,7,8,8]

    # when
    result = @quick_union.union(4,3)
                         .union(3,8)
                         .union(6,5)
                         .union(9,4).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_confirm_connection
    # given
    @quick_union.union(2,9)

    # when
    is_connected = @quick_union.connected?(2,9)

    # then
    assert_true is_connected
  end

  def test_it_should_not_confirm_connection
    # given
    @quick_union.union(2,9)

    # when
    is_connected = @quick_union.connected?(2,8)

    # then
    assert_false is_connected
  end

  def test_it_should_confirm_connection_between_3_6
    # given
    @quick_union.union(2,9)
                .union(4,9)
                .union(3,4)
                .union(5,6)
                .union(9,6)

    # when
    is_connected = @quick_union.connected?(3,6)

    # then
    assert_true is_connected
  end

  def test_it_should_not_confirm_connection_between_3_0
    # given
    @quick_union.union(2,9)
                .union(4,9)
                .union(3,4)
                .union(5,6)
                .union(9,6)

    # when
    is_connected = @quick_union.connected?(3,0)

    # then
    assert_false is_connected
  end
end
