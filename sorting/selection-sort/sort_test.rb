require 'test/unit'
require_relative 'sort'

module Selection
  class SortTest < Test::Unit::TestCase
    def setup
      @sort = Selection::Sort.new
    end

    def test_it_should_return_same_input_value
      assert_equal nil, @sort.sort(nil)
      assert_equal [] , @sort.sort([])
      assert_equal [1], @sort.sort([1])
    end

    def test_it_should_sort_numbers
      assert_equal [1,2], @sort.sort([1,2])
      assert_equal [1,2], @sort.sort([2,1])
      assert_equal [5,10], @sort.sort([5,10])
      assert_equal [5,10], @sort.sort([10,5])
      assert_equal [1,2,3], @sort.sort([3,1,2])
      assert_equal [1,1,3], @sort.sort([3,1,1])

      assert_equal [1,2,3,10,50], @sort.sort([10,50,3,1,2])
    end

    def test_it_should_sort_strings
      assert_equal ['a','b'], @sort.sort(['a','b'])
      assert_equal ['a','b'], @sort.sort(['b','a'])
      assert_equal ['a','z'], @sort.sort(['a','z'])
      assert_equal ['a','z'], @sort.sort(['z','a'])
      assert_equal ['a','a','z'], @sort.sort(['z','a','a'])
      assert_equal ['a','b','m','z'], @sort.sort(['z','a','b','m'])
    end
  end
end
