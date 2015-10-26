require 'pry'

class Node # Needs to know that a new link has been created and to which Node.
  attr_accessor :linked_right, :linked_left, :result
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

  def insert_node(data) # NOT IMPLEMENTED YET, WAITING TO FIX 'reorient_if_applicable'
    reorient_if_applicable(data)
    add(data)
  end

  def reorient_if_applicable(data) # NOT IMPLEMENTED YET
    escape = false
    current = self
    result = 0
    while data != self.data && escape.nil? # THIS WHOLE LOOP IS NOT WORKING
      if data > current.data
        if current.linked_right
          current = current.linked_right
        else
          result += 1
          escape = true
        end
      elsif data < current.data
        if current.linked_left
          current = current.linked_left
        else
          result += 1
          escape = true
        end
      end
    end
    result
  end

  def add(data) # WORKS, BUT NOT IMPLEMENTED
    current = self
    if data == self.data
      "add"
    elsif data > self.data
      self.linked_right = Node.new(data)
      current = self.linked_right
    elsif data < self.data
      self.linked_left = Node.new(data)
      current = self.linked_left
    end
  end

  def to_a
    linked_left.to_a + [@data] + linked_right.to_a
  end

  def max_depth
    left_depth = linked_left ? linked_left.max_depth : 0
    right_depth = linked_right ? linked_right.max_depth : 0
    case left_depth <=> right_depth
      when -1 then (1 + right_depth)
      when 0 then (1 + right_depth)
      when 1 then (1 + left_depth)
    end
  end
end