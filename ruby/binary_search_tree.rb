class BinarySearchTree

  attr_accessor :value, :left, :right, :level

  def initialize(value, left = nil, right = nil, level = 0)
    @value, @left, @right, @level = value, left, right, level
  end


  def insert(input)
    if input < @value
      if !@left
        @left = BinarySearchTree.new(input)
        @left.level = self.level + 1
      else
        @left.insert(input)
      end
    elsif input > @value
      if !@right
        @right = BinarySearchTree.new(input)
        @right.level = self.level + 1
      else
        @right.insert(input)
      end
    end
  end

  def inclusion_check(subject, input, result)
    if(input == subject.value)
      result = true
    elsif(input < subject.value)
      if subject.left != nil
        inclusion_check(subject.left, input, result)
      else
        result
      end
    elsif(input > subject.value)
      if subject.right != nil
        inclusion_check(subject.right, input, result)
      else
        result
      end
    end
  end


  def contains(input)
    result = false
    subject = self
    self.inclusion_check(subject, input, result)
  end



  def DFS_to_array(input = nil, vals = [])
    subject = self

    if subject.value
      vals << subject.value
    end

    if subject.left
      input = subject.left.value
      subject.left.DFS_to_array(input, vals)
    end

    if subject.right
      input = subject.right.value
      subject.right.DFS_to_array(input, vals)
    end

    vals
  end

  def BFS_to_array(input = nil, vals = [], level = 0, next_nodes = [], seen = {}, max_len = self.DFS_to_array.length)
    if seen.keys.length == max_len
      return
    end

    if level > 0
      next_nodes = next_nodes.slice(level, level*2)
      level = level + 1
    else
      input = self
    end

    if input.value
      if seen[input.value] == nil
        vals << input.value
        seen[input.value] = input.value
        if level == 0
          level = level + 1
        end
      end
    end


    if input.left
      next_nodes << input.left
    end

    if input.right
      next_nodes << input.right
    end

    if next_nodes != nil
      0.upto(next_nodes.length) do |i|
        p next_nodes[i].class
        if next_nodes[i].class == BinarySearchTree
          self.BFS_to_array(input = next_nodes[i], vals, level, next_nodes, seen)
        end
      end
    end

    return vals
  end

end

BST = BinarySearchTree.new(10)
BST.insert(9)
BST.insert(6)
BST.insert(5)
BST.insert(8)
BST.contains(10)
BST.insert(15)
BST.insert(13)
BST.insert(20)
BST.DFS_to_array()
BST.BFS_to_array()
