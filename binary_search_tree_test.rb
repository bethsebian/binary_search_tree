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

  def test_it_pushes_an_element_onto_the_list
    list.push("hammock")
    assert_equal 1, list.count
  end

  def test_it_pushes_elements_onto_the_list
    list.push("hammock")
    list.push("adirondack")
    assert_equal 2, list.count
  end

  def test_it_pushes_element_to_left_if_less_than_root
    list.push("hammock")
    list.push("adirondack")
    assert_equal "adirondack", list.root.linked_left.data
  end

  def test_it_pushes_element_to_right_if_greater_than_root
    list.push("hammock")
    list.push("moccasin")
    assert_equal "moccasin", list.root.linked_right.data
  end

  def test_it_arranges_trees_with_two_layers_of_elements
    list.push("hammock")
    list.push("moccasin")
    list.push("adirondack")
    assert_equal "moccasin", list.root.linked_right.data
    assert_equal "adirondack", list.root.linked_left.data
  end

  def test_it_arranges_trees_with_three_layers_of_elements
    list.push(8)
    list.push(14)
    list.push(19)
    list.push(5)
    list.push(3)
    list.push(7)
    list.push(16)
    assert_equal 19, list.root.linked_right.linked_right.data
    assert_equal 7, list.root.linked_left.linked_right.data
  end

  def test_it_can_verify_the_presence_of_an_element_in_the_root_node
    list.push(8)
    list.push(14)
    list.push(5)
    assert list.include?(8)
  end

  def test_it_can_refute_the_presence_of_an_element_in_the_root_node
    list.push(8)
    refute list.include?(14)
  end

  def test_it_can_verify_the_presence_of_an_element_in_tree_with_depth_of_one
    list.push(8)
    list.push(5)
    list.push(12)
    assert list.include?(5)
    assert list.include?(12)
    assert list.include?(8)
  end

  def test_it_can_verify_the_presence_of_an_element_in_tree_with_depth_of_two
    list.push(8)
    list.push(5)
    list.push(14)
    list.push(3)
    list.push(16)
    list.push(7)
    list.push(19)
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





end