class Node
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
    new_node = Node.new(data, nil, nil)

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
