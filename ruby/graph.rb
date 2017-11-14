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



ze_graph = Graph.new()

ze_graph.add_node(1)
ze_graph.add_node(2)
ze_graph.contains(2)
ze_graph.remove_node(2)
ze_graph.contains(2)
ze_graph.contains(1)
ze_graph.add_node(2)
ze_graph.add_node(3)
ze_graph.add_edge(3, 2)
ze_graph.has_edge(3, 2)
ze_graph.has_edge(3, 1)
ze_graph.add_node(4)
ze_graph.add_node(5)
ze_graph.add_edge(5, 4)
ze_graph.remove_edge(4, 5)
ze_graph.has_edge(4, 5)
ze_graph.remove_edge(2, 3)
ze_graph.remove_node(5)

ze_graph.add_node(0)
ze_graph.add_node(1)
ze_graph.add_node(2)
ze_graph.add_node(3)
ze_graph.add_edge(0, 1)
ze_graph.add_edge(0, 2)
ze_graph.add_edge(1, 2)
ze_graph.add_edge(2, 0)
ze_graph.add_edge(2, 3)
ze_graph.add_edge(3, 1)
p ze_graph.data
ze_graph.depth_first_search(2)
