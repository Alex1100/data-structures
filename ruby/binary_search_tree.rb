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

  def BFS_to_array(vals = [])
    current = [self]

    while(current.length > 0)

      next_nodes = []

      current.each do |node|
        vals << node.value

        if(node.left)
          next_nodes << node.left
        end

        if(node.right)
          next_nodes << node.right
        end

      end

      current = next_nodes
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
