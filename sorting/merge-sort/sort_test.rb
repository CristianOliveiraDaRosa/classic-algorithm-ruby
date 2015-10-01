require 'test/unit'
require_relative 'sort'

module Merge
  class SortTest < Test::Unit::TestCase
    def setup
      @sorter = Merge::Sort.new
    end

    def test_it_should_return_same_input_value_when_input_cannot_be_sorted
      assert_equal nil, @sorter.sort(nil)
      assert_equal [] , @sorter.sort([])
      assert_equal [1], @sorter.sort([1])
    end

    def test_it_should_keep_sorted
      assert_equal [1, 2], @sorter.sort([1, 2])
      assert_equal [5, 10], @sorter.sort([5, 10])
      assert_equal [1, 2, 3], @sorter.sort([1, 2, 3])
      assert_equal [1, 2, 3, 10, 50], @sorter.sort([1, 2, 3, 10, 50])

      assert_equal %w(a b), @sorter.sort(%w(a b))
      assert_equal %w(a z), @sorter.sort(%w(a z))
      assert_equal %w(a b c), @sorter.sort(%w(a b c))
    end

    def test_it_should_sort_numbers
      assert_equal [1, 2], @sorter.sort([2, 1])
      assert_equal [5, 10], @sorter.sort([10, 5])
      assert_equal [1, 2, 3, 4], @sorter.sort([3, 1, 2, 4])
      assert_equal [1, 2, 3, 10, 50], @sorter.sort([10, 50, 3, 1, 2])
      assert_equal [1, 2, 3, 4, 5, 6, 7], @sorter.sort([7, 6, 5, 4, 3, 2, 1])
    end

    def test_it_should_sort_when_has_duplicated_values
      assert_equal [1, 1, 2], @sorter.sort([2, 1, 1])
      assert_equal [5, 5, 10], @sorter.sort([10, 5, 5])
      assert_equal [1, 2, 2, 3], @sorter.sort([3, 2, 1, 2])
      assert_equal [1, 2, 3, 10, 10, 10, 50], @sorter.sort([10, 10, 10, 50, 3, 1, 2])
    end

    def test_it_should_sort_strings
      assert_equal %w(a b), @sorter.sort(['b', 'a'])
      assert_equal %w(a z), @sorter.sort(['z', 'a'])
      assert_equal %w(a a z), @sorter.sort(['z', 'a', 'a'])
      assert_equal %w(a b m z), @sorter.sort(['z', 'a', 'b', 'm'])
    end

  end
end
