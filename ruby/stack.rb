class Stack

  attr_reader :items, :size

  def initialize(items = {}, size = 0)
    @items, @size = items, size
  end


  def push item
    if self.size == 0
      self.items[0] = item
    else
      allItems = self.items.values
      allItems.unshift(item)
      self.size = self.size + 1

      allItems.each_with_index do |el, i|
        self.items[i] = el
      end
    end
  end


  def self.pop
    topObject = ''

    allItems = self.items.values
    topObject = allItems[0]
    zeItems = allItems[1..allItems.length - 1]

    zeItems.each_with_index do |el, i|
      self.items[i] = el
    end

    delete self.items[self.size - 1]

    self.size = self.size - 1

    topObject
  end


  def self.peek
    self.items[0]
  end


  def self.is_empty?
    self.size  === 0 ? true : false
  end


  def self.clear
    self.items = {}
    self.size = 0
  end


  def self.stack_size
    self.size
  end


  def self.to_array
    self.items.values
  end

end
