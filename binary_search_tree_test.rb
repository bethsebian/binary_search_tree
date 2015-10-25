gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'binary_search_tree.rb'

class BinarySearchTreeTest < Minitest::Test
  attr_reader :list

  def setup
    @list = BinarySearchTree.new
  end

  def test_it_starts_with_zero_elements
    assert_equal 0, list.count
  end

  def test_it_inserts_an_element_onto_the_list
    list.insert("hammock")
    assert_equal 1, list.count
  end

  def test_it_inserts_elements_onto_the_list
    list.insert("hammock")
    list.insert("adirondack")
    assert_equal 2, list.count
  end

  def test_it_inserts_element_to_left_if_less_than_root
    list.insert("hammock")
    list.insert("adirondack")
    assert_equal "adirondack", list.root.linked_left.data
  end

  def test_it_inserts_element_to_right_if_greater_than_root
    list.insert("hammock")
    list.insert("moccasin")
    assert_equal "moccasin", list.root.linked_right.data
  end

  def test_it_arranges_trees_with_two_layers_of_elements
    list.insert("hammock")
    list.insert("moccasin")
    list.insert("adirondack")
    assert_equal "moccasin", list.root.linked_right.data
    assert_equal "adirondack", list.root.linked_left.data
  end

  def test_it_arranges_trees_with_three_layers_of_elements
    list.insert(8)
    list.insert(14)
    list.insert(19)
    list.insert(5)
    list.insert(3)
    list.insert(7)
    list.insert(16)
    assert_equal 19, list.root.linked_right.linked_right.data
    assert_equal 7, list.root.linked_left.linked_right.data
  end

  def test_it_can_verify_the_presence_of_an_element_in_the_root_node
    list.insert(8)
    list.insert(14)
    list.insert(5)
    assert list.include?(8)
  end

  def test_it_can_refute_the_presence_of_an_element_in_the_root_node
    list.insert(8)
    refute list.include?(14)
  end

  def test_it_can_verify_the_presence_of_an_element_in_tree_with_depth_of_one
    list.insert(8)
    list.insert(5)
    list.insert(12)
    assert list.include?(5)
    assert list.include?(12)
    assert list.include?(8)
  end

  def test_it_can_verify_the_presence_of_an_element_in_tree_with_depth_of_two
    list.insert(8)
    list.insert(5)
    list.insert(14)
    list.insert(3)
    list.insert(16)
    list.insert(7)
    list.insert(19)
    assert list.include?(8)
    assert list.include?(5)
    assert list.include?(14)
    assert list.include?(3)
    assert list.include?(16)
    assert list.include?(7)
    assert list.include?(19)
    refute list.include?(1)
    refute list.include?(4)
    refute list.include?(17)
    refute list.include?(21)
    refute list.include?(200)
  end

  def test_it_finds_the_maximum_value_in_the_tree
    list.insert(8)
    list.insert(5)
    list.insert(14)
    list.insert(3)
    list.insert(16)
    list.insert(7)
    list.insert(19)
    assert_equal 19, list.max_value
  end

  def test_it_finds_the_minimum_value_in_the_tree
    list.insert(8)
    list.insert(5)
    list.insert(14)
    list.insert(3)
    list.insert(16)
    list.insert(7)
    list.insert(19)
    assert_equal 3, list.min_value
  end

  def test_it_implements_a_sort_that_outputs_an_array_of_values_in_sorted_order
    list.insert(8)
    list.insert(5)
    list.insert(14)
    list.insert(3)
    list.insert(16)
    list.insert(7)
    list.insert(19)
    assert_equal [3,5,7,8,14,16,19], list.to_a
  end

  def test_it_implements_a_sort_that_outputs_an_array_of_values_in_sorted_order
    list.insert(8)
    assert_equal [8], list.to_a
  end

  def test_it_implements_a_sort_that_outputs_an_array_of_values_in_sorted_order
    assert_equal [], list.to_a
  end

  def test_it_reports_the_max_depth_of_a_tree_with_6_levels
    list.insert(8)
    list.insert(14)
    list.insert(16)
    list.insert(19)
    list.insert(20)
    list.insert(21)
    assert_equal 6, list.max_depth
  end

  def test_it_reports_the_max_depth_of_a_tree_with_4_levels
    list.insert(8)
    list.insert(14)
    list.insert(12)
    list.insert(19)
    list.insert(18)
    list.insert(21)
    assert_equal 4, list.max_depth
  end

  def test_it_reports_the_max_depth_of_a_tree_with_1_level
    list.insert(8)
    assert_equal 1, list.max_depth
  end
end