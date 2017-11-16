class Graph:

  def __init__(self):
    self.data = {};
    self.nodes_array = [];
    self.edges = [];

  def add_node(self, node):
    if (not node in self.data.values()):
      self.data[node] = [];
      self.nodes_array.append(node);
    print(self.nodes_array)


  def contains(self, item):
    return item in self.data.keys();


  def remove_node(self, node):
    refs_to_remove = self.data[node];
    del self.data[node];
    for i in range(len(refs_to_remove)):
      if(node in self.data[refs_to_remove[i]].values()):
        item = self.data[refs_to_remove[i]].index(node);
        a = self.data[refs_to_remove[i]][0::item];
        b = self.data[refs_to_remove[i]][item::];
        self.data[refs_to_remove[i]] = a + b;


    idx_to_remove = self.nodes_array.index(node);

    a = self.nodes_array[0: idx_to_remove];
    b = self.nodes_array[idx_to_remove + 1:];

    if type(self.nodes_array[idx_to_remove]) == int:
      print("REMOVED NODE IS: {:d}".format(self.nodes_array[idx_to_remove]));
    else:
      print("REMOVED NODE IS: {:s}".format(self.nodes_array[idx_to_remove]));

    self.nodes_array = a + b;
    return self.nodes_array;


  def has_edge(self, from_node, to_node):
    print(to_node in self.data[from_node]);
    return to_node in self.data[from_node];


  def add_edge(self, from_node, to_node):
    self.data[from_node].append(to_node);
    self.data[to_node].append(from_node);


  def remove_edge(self, from_node, to_node):
    param_1 = self.data[from_node].index(to_node);
    param_2 = self.data[to_node].index(from_node);
    del self.data[from_node][param_2];
    del self.data[to_node][param_1];


  def DFSUtil(self, node, visited, visited_data):
    visited[node] = True;
    if not node in visited_data:
      visited_data.append(node);

    for i in range(len(self.data[node])):
      if visited[i] == False:
        self.DFSUtil(self.data[node][i], visited, visited_data);



  def depth_first_search(self, node):
    visited = [False] * len(self.nodes_array);

    visited_data = [];
    self.DFSUtil(node, visited, visited_data);
    print("ALL NODES ARE: {:s}".format(visited_data));
    return visited_data;




ze_graph = Graph()

ze_graph.add_node(1)
ze_graph.add_node(2)
ze_graph.remove_node(2)
print(ze_graph.contains(2));
print(ze_graph.contains(1));
ze_graph.add_node(2)
ze_graph.add_node(3)
ze_graph.add_edge(3, 2)
ze_graph.has_edge(3, 2)
ze_graph.remove_edge(2, 3);
ze_graph.has_edge(3, 2)
ze_graph.add_node(4)
ze_graph.add_node(5)
ze_graph.remove_node(5)

ze_graph.add_node(0)
print(ze_graph.nodes_array);
print(ze_graph.data);
ze_graph.add_edge(0, 1)
ze_graph.add_edge(0, 2)
ze_graph.add_edge(1, 2)
ze_graph.add_edge(2, 0)
ze_graph.add_edge(2, 3)
ze_graph.add_edge(3, 1)
print(ze_graph.data)
ze_graph.depth_first_search(2)
