require 'pry'

class BinarySearchTree # Describes the list
  attr_reader :root

  def count
    if root.nil?
      0
    else
      current = root
      count = 1
      # This won't work for trees with multiple levels of branching.
      while current.linked_right
        count += 1
        current = current.linked_right
      end
      while current.linked_left
        count += 1
        current = current.linked_left
      end
      count
    end
  end

  def push(data)
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

  def linked_left?
    linked_left
  end
end