class Node
  attr_accessor :data, :next_in_line

  def initialize(data, next_in_line)
    @data = data
    @next_in_line = next_in_line
  end
end


class LinkedList
  attr_reader :head, :tail, :length


  def initialize(head, tail, length)
    @head, @tail, @length = head, tail, length
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

      return new_node
    end
  end



  def search(position)
    currentNode = @head
    len = @length
    count = 1
    message = 'Non-Existent Node'

    if(len === 0 || position < 1 || position > len)
      raise message
    end

    while(count < position)
      currentNode = currentNode.next_in_line
      count = count + 1
    end

    return currentNode
  end


  def remove(position)
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

    if(position === 1)
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
