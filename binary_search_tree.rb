require 'pry'
require_relative 'helper'

class BinarySearchTree
  include Helper # Describes the list
  attr_reader :root

  def insert(data)
    if root.nil?
      @root = Node.new(data)
    else
      current = root
      while data > current.data && current.linked_right?
        current = current.linked_right
      end
      while data < current.data && current.linked_left?
        current = current.linked_left
      end
      if data > current.data
          current.linked_right = Node.new(data)
      elsif data < current.data
        current.linked_left = Node.new(data)
      else data = current.data
        "same"
      end
    end
  end

  def include?(data)
    current = root
    if current.data.nil?
      false
    elsif data == current.data
      true
    else
      while data != current.data
        if data < current.data
          if current.linked_left.nil?
            result = false
            break
          else current = current.linked_left
            if data == current.data
              result = true                   # WORKS
            else
              redo
            end
          end
        else data > current.data
          if current.linked_right.nil?
            result = false                    # ?
            break
          else current = current.linked_right
            if data == current.data
              result = true
            else
              redo
            end
          end
        end
      end
      result
    end
  end

  def max_value
    current = root
    while current.linked_right
      current = current.linked_right
    end
    current.data
  end

  def min_value
    current = root
    while current.linked_left
      current = current.linked_left
    end
    current.data
  end

  def to_a
    root.to_a
  end

  def max_depth
    root.max_depth
  end

end

class Node # Needs to know that a new link has been created and to which Node.
  attr_accessor :linked_right, :linked_left
  attr_reader :data

  def initialize(input_data)
    @data = input_data
  end

  def linked_right?
    linked_right
  end

  def to_a
    linked_left.to_a + [@data] + linked_right.to_a
  end

  def max_depth
    # need variable because I can't call my method on nil?
    left_depth = linked_left ? linked_left.max_depth : 0
    right_depth = linked_right ? linked_right.max_depth : 0
    case left_depth <=> right_depth
      when -1 then (1 + right_depth)
      when 0 then (1 + right_depth)
      when 1 then (1 + left_depth)
    end
  end

  def linked_left?
    linked_left
  end
end