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
