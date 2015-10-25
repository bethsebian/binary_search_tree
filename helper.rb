module Helper
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
end