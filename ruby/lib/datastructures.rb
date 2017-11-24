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



class DoublyNode
  attr_accessor :data, :next_in_line, :prev

  def initialize(data, next_in_line, prev)
    @data = data
    @next_in_line = next_in_line
    @prev = prev
  end
end




class DoublyLinkedList

  attr_reader :head, :tail, :length


  def initialize(head, tail, length)
    @head, @tail, @length = head, tail, length
  end



  def remove_dups_and_reinitialize
    if !@head || !@head.next_in_line
      raise 'No duplicates were found. Empty or a single element Linked List.'
    end

    p1 = ''
    p2 = ''
    nodes = {}

    p1 = @head
    p2 = p1.next_in_line
    nodes[p1.data] = [true, p1.data]
    uniq = [p1.data]

    while (p2)
      info = p2.data
      if nodes[info]
        p1.next_in_line = p2.next_in_line
      else
        nodes[info] = [true, info]
        uniq.push(info)
        p1 = p2
      end
      p2 = p2.next_in_line;
    end

    freshLL = DoublyLinkedList.new(nil, nil, 0);

    uniq.each_with_index do |el, i|
      freshLL.add(el);
    end

    @head = nil;
    @length = nil;
    @tail = nil;

    freshLL;
  end


  def add(data)
    new_node = DoublyNode.new(data, nil, nil)

    if @head == nil
      @head = new_node
      @head.prev = nil
      @head.next_in_line = nil
      @tail = @head
      @length = @length + 1

      return new_node
    end

    current = @head

    while current.next_in_line != nil
      current = current.next_in_line
    end

    current.next_in_line = new_node
    current.next_in_line.prev = current
    current = current.next_in_line
    @tail = current
    @length = @length + 1
    return new_node
  end


  def search_by_position(position)
    current_node = @head
    length = @length
    count = 1
    message = 'Non-Existent Node'

    if length == 0 || position < 1 || position > length
      raise message
    end

    while count < position
      current_node = current_node.next_in_line
      count = count + 1
    end

    current_node
  end


  def get_item(input)
    current = @head

    while current != nil
      if current.data == input
        return current
      end
      current = current.next_in_line
    end

    current
  end


  def contains(input)
    self.get_item(input) == nil ? false : true
  end


  def remove_by_input(input)
    target = self.get_item(input)
    if target == nil
      return target
    end

    #case for when linked list length > 2
    if target.next_in_line != nil
      next_node = target.next_in_line
      next_node.prev = target.prev

      if target.prev != nil
        target.prev.next_in_line = next_node
      else
        @head = next_node
      end
    else
      if target.prev == nil
        @head = nil
      else
        target.prev.next_in_line = nil
        @tail = target.prev
      end
    end

    @length = @length - 1
    target
  end
end



class Graph

  attr_accessor :data, :nodes_array, :edges

  def initialize(data = {}, nodes_array = [], edges = [])
    @data, @nodes_array, @edges = data, nodes_array, edges
  end

  def add_node(node)
    if (!@data[node])
      @data[node] = []
      @nodes_array << node
    end
  end


  def contains(item)
    return @data[item] ? true : false
  end


  def remove_node(node)
    refs_to_remove = @data[node]
    @data.delete(node)
    refs_to_remove.each do |ref|
      if(@data[ref].include?(node))
        item = @data[ref].index(node)
        @data[ref].slice!(item, 1)
      end
    end


    idx_to_remove = @nodes_array.index(node)

    @nodes_array.slice!(idx_to_remove, 1)
  end


  def has_edge(from_node, to_node)
    return @data[from_node].include?(to_node)
  end


  def add_edge(from_node, to_node)
    @data[from_node] << to_node
    @data[to_node] << from_node
  end


  def remove_edge(from_node, to_node)
    param_1 = @data[from_node].index(to_node)
    param_2 = @data[to_node].index(from_node)
    @data[from_node].delete(@data[from_node][param_2])
    @data[to_node].delete(@data[to_node][param_1])
  end


  def DFSUtil(node, visited, visited_data)
    visited[node] = true
    if !visited_data.include?(node)
      visited_data << node
    end

    @data[node].each_with_index do |i_node, i|
      if visited[i] == false
        self.DFSUtil(i_node, visited, visited_data)
      end
    end
    return visited_data
  end


  def depth_first_search(node)
    visited = [false] * @nodes_array.length
    visited_data = []
    self.DFSUtil(node, visited, visited_data)
  end

end




class LimitedArray

  attr_accessor :limit, :storage

  def initialize(limit, storage = {})
    @limit, @storage = limit, storage
  end


  def get(idx)
    self.check_limit(idx)
    @storage[idx]
  end

  def set(idx, value)
    self.check_limit(idx)
    @storage[idx] = value
  end

  def each
    @storage.each_with_index do |item, i|
      Proc.new do |storage|
        storage = @storage
        return storage[i], i, storage
      end
    end
  end

  def check_limit(idx)
    if idx.class != Fixnum
      raise "Setter requires a numeric index for its first argument"
    end

    if @limit <= idx
      raise "Error trying to access an over-the-limit index"
    end

    self
  end

end



class Queue

  attr_reader :items, :size


  def initialize(items = {}, size = 0)
    @items, @size = items, size
  end


  def enqueue item
    if @size == 0
      @items[0] = item
      @size = @size + 1
    else
      all_items = @items.values
      all_items.unshift(item)
      @size = @size + 1

      all_items.each_with_index do |el, i|
        @items[i] = el
      end
    end
  end


  def dequeue
    first_in_queue = ''
    all_items = @items.values
    first_in_queue = all_items.last
    ze_items = all_items[0..all_items.length - 1]

    ze_items.each_with_index do |el , i|
      @items[i] = el
    end

    @items.delete(@size - 1)
    @size = @size - 1
    first_in_queue
  end


  def contains item
    @items.values.any?{|obj| obj === item}
  end


  def clear
    @items = {}
    @size = 0
  end


  def peek
    @items[@size - 1]
  end


  def to_array
    @items.values
  end

end





class SinglyNode
  attr_accessor :data, :next_in_line

  def initialize(data, next_in_line)
    @data = data
    @next_in_line = next_in_line
  end
end


class LinkedList
  attr_accessor :head, :tail, :length


  def initialize(head, tail, length)
    @head, @tail, @length = head, tail, length
  end


  def remove_dups_and_reinitialize
    if !@head || !@head.next_in_line
      raise 'No duplicates were found. Empty or a single element Linked List.'
    end

    p1 = ''
    p2 = ''
    nodes = {}

    p1 = @head
    p2 = p1.next_in_line
    nodes[p1.data] = [true, p1.data]
    uniq = [p1.data]

    while (p2)
      info = p2.data
      if nodes[info]
        p1.next_in_line = p2.next_in_line
      else
        nodes[info] = [true, info]
        uniq << info
        p1 = p2
      end
      p2 = p2.next_in_line
    end

    freshLL = LinkedList.new(nil, nil, 0)

    uniq.each do |el, i|
      freshLL.add(el)
    end

    @head = nil
    @length = nil
    @tail = nil

    freshLL
  end


  def add(data)
    new_node = SinglyNode.new(data, nil)

    if @head == nil
      @head = new_node
      @tail = @head
      @length = @length + 1

      return new_node
    elsif @head != nil
      current = @head

      while(current.next_in_line)
        current = current.next_in_line
      end

      current.next_in_line = new_node
      @tail = current.next_in_line
      @length = @length + 1

      new_node
    end
  end



  def search_by_position(position)
    current_node = @head
    len = @length
    count = 1
    message = 'Non-Existent Node'

    if(len == 0 || position < 1 || position > len)
      raise message
    end

    while(count < position)
      current_node = current_node.next_in_line
      count = count + 1
    end

    return current_node
  end

  def get_item(input)
    current = @head
    while current != nil
      if current.data == input
        return current
      end
      current = current.next_in_line
    end
    return current
  end

  def contains(input)
    self.get_item(input) != nil ? true : false
  end


  def remove_by_input(input)
    if self.get_item(input) == nil
      return nil
    end

    if @head.data == input
      @head = @head.next_in_line
      return
    end

    node = self.find_before(input)
    node.next_in_line = node.next_in_line.next_in_line
  end

  def find_before(input)
    node = @head

    return false if !node.next_in_line
    return node if node.next_in_line.data == input

    while (node = node.next_in_line)
      return node if node.next_in_line && node.next_in_line.data == input
    end
  end


  def remove_by_position(position)
    current_node = @head
    len = @length
    count = 0
    message = 'Non-Existent Node'
    before_node_to_delete = nil
    node_to_delete = nil
    deleted_node = nil


    if(position < 0 || position > len)
      raise message
    end

    if(position == 1)
      @head = current_node.next_in_line
      deleted_node = current_node
      current_node = nil
      @length = @length - 1

      return deleted_node
    end

    while(count < position)
      before_node_to_delete = current_node
      node_to_delete = current_node.next_in_line
      count = count + 1
    end

    before_node_to_delete.next_in_line = node_to_delete.next_in_line
    deleted_node = node_to_delete
    node_to_delete = nil
    @length = @length - 1

    return deleted_node
  end

end


class Stack

  attr_reader :items, :size

  def initialize(items = {}, size = 0)
    @items, @size = items, size
  end


  def push item
    if @size == 0
      @items[0] = item
      @size = @size + 1
    else
      all_items = @items.values
      all_items.unshift(item)
      @size = @size + 1

      all_items.each_with_index do |el, i|
        @items[i] = el
      end
    end
  end


  def pop
    top_object = ''
    all_items = @items.values
    top_object = all_items[0]
    ze_items = all_items[1..all_items.length]

    ze_items.each_with_index do |el, i|
      @items[i] = el
    end


    @items.delete(@size - 1)
    @size = @size - 1
    top_object
  end


  def peek
    @items[0]
  end


  def is_empty?
    @size  === 0 ? true : false
  end


  def clear
    @items = {}
    @size = 0
  end


  def stack_size
    @size
  end


  def to_array
    @items.values
  end

end




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
