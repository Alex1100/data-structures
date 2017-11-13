class Node
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

    freshLL = LinkedList.new(nil, nil, 0);

    uniq.each do |el, i|
      freshLL.add(el);
    end

    @head = nil;
    @length = nil;
    @tail = nil;

    freshLL;
  end


  def add(data)
    new_node = Node.new(data, nil)

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
