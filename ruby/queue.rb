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
      allItems = @items.values
      allItems.unshift(item)
      @size = @size + 1

      allItems.each_with_index do |el, i|
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
