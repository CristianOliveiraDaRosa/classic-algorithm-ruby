require 'test/unit'
require_relative 'sort'

module Shell
  class SortTest < Test::Unit::TestCase
    def setup
      @selection = Shell::Sort.new
    end

    def test_it_should_return_same_input_value_when_input_cannot_be_sorted
      assert_equal nil, @selection.sort(nil)
      assert_equal [] , @selection.sort([])
      assert_equal [1], @selection.sort([1])
    end

    def test_it_should_keep_sorted
      assert_equal [1, 2], @selection.sort([1, 2])
      assert_equal [5, 10], @selection.sort([5, 10])
      assert_equal [1, 2, 3, 10, 50], @selection.sort([1, 2, 3, 10, 50])

      assert_equal ['a', 'b'], @selection.sort(['a', 'b'])
      assert_equal ['a', 'z'], @selection.sort(['a', 'z'])
      assert_equal ['a', 'b', 'c'], @selection.sort(['a', 'b', 'c'])
    end

    def test_it_should_sort_numbers
      assert_equal [1, 2], @selection.sort([2, 1])
      assert_equal [5, 10], @selection.sort([10, 5])
      assert_equal [1, 2, 3], @selection.sort([3, 1, 2])
      assert_equal [1, 2, 3, 10, 50], @selection.sort([10, 50, 3, 1, 2])
    end

    def test_it_should_sort_when_has_duplicated_values
      assert_equal [1, 1, 2], @selection.sort([2, 1, 1])
      assert_equal [5, 5, 10], @selection.sort([10, 5, 5])
      assert_equal [1, 2, 2, 3], @selection.sort([3, 2, 1, 2])
      assert_equal [1, 2, 3, 10, 10, 10, 50], @selection.sort([10, 10, 10, 50, 3, 1, 2])
    end

    def test_it_should_sort_strings
      assert_equal ['a', 'b'], @selection.sort(['b', 'a'])
      assert_equal ['a', 'z'], @selection.sort(['z', 'a'])
      assert_equal ['a', 'a', 'z'], @selection.sort(['z', 'a', 'a'])
      assert_equal ['a', 'b', 'm', 'z'], @selection.sort(['z', 'a', 'b', 'm'])
    end

    def test_it_should_consider_nil_values_as_zero
      assert_equal [nil, 1, 2], @selection.sort([2, nil, 1])
      assert_equal [nil, nil, 2, 10, 11], @selection.sort([2, nil, 10, 11, nil])
      assert_equal [-1, nil, 2, 10, 11], @selection.sort([2, -1, 10, 11, nil])
    end
  end
end
