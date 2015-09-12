require 'test/unit'
require_relative 'quick_find'

class QuickFindTest < Test::Unit::TestCase

  def setup
    @quick_find = QuickFind.new 5
  end

  def test_it_should_initialize_the_ids
    # given
    expected = [0,1,2,3,4]
    array_lenght = 5

    # when
    result = QuickFind.new array_lenght

    # then
    assert_equal expected, result.elements
  end

  def test_it_should_connect_first_number_with_second
    # given
    expected = [0,2,2,3,4]
    number_one = 1
    number_two = 2

    # when
    result = @quick_find.union(number_one, number_two).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_connect_all_connections_number_with_second
    # given
    expected = [0,3,3,3,4]

    # when
    result = @quick_find.union(1, 2).union(2, 3).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_not_change_when_numbers_have_already_connected
    # given
    expected = [0,3,3,3,4]

    # when
    result = @quick_find.union(1, 2).union(2, 3).union(3, 2).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_create_distinct_connections
    # given
    expected = [4,2,2,3,4]

    # when
    result = @quick_find.union(1, 2).union(0, 4).elements

    # then
    assert_equal expected, result
  end

  def test_it_should_be_connected
    # given
    @quick_find.union(1, 2)

    # when
    result = @quick_find.connected?(1, 2)

    # then
    assert_true result
  end

end
