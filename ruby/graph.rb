class Graph

  attr_accessor :data, :nodes_array, :edges

  def inintialize(data = {}, nodes_array = [], edges = [])
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
    delete @data[node]
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
    delete @data[from_node][param_2]
    delete @data[to_node][param_1]
  end

  def for_each_node
    info = ''
    @nodes_array.each do |node|
      Proc.new |info|
      info = node
      return node
    end
  end
