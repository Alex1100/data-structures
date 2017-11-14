class Tree

  attr_accessor :value, :children, :parent


  def initialize(value, children = [], parent = nil)
    @value, @children, @parent = value, children, parent
  end


  def add_child(value)
    parent = self
    child = Tree.new(value)
    child.parent = parent
    self.children << child
  end


  def remove_from_parent
    if @parent
      child_node_index = self.parent.children.index(self)
      self.parent.children = self.parent.children.reject{|child| child == self}
      self.parent = nil
    end
  end

  def inclusion_check(child, target, result)
    if child.value == target
      result = true
      return result
    elsif child.value != target && child.children.length > 0
      child.children.each_with_index do |kid, z|
        return inclusion_check(kid, target, result)
      end
    end

    return result
  end


  def contains(target)
    result = false

    if @value == target
      return true
    elsif @value != target
      @children.each_with_index do |child, i|
        return self.inclusion_check(child, target, result)
      end
    end
  end


  def tree_mapper(child, result)
    if child.value
      result << child.value
    elsif child.value && child.children.length > 0
      child.children.each do |kid|
        return tree_mapper(kid, result)
      end
    end

    return result
  end


  def traverse
    result = []

    if @value
      result << @value
      @children.each do |child|
        self.tree_mapper(child, result)
      end
    end

    return result
  end

end





abc = Tree.new(10)
abc.add_child(15)
abc.add_child(20)
abc.children[0].add_child('YOOOOOOO')
abc.contains(10)
abc.contains(15)
abc.contains(11)
abc.contains('YOOOOOOO')
abc.children[0].children[0].remove_from_parent
abc.contains('YOOOOOOO')
abc.traverse
