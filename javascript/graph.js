var Graph = function() {
  this.data = {};
  this.nodesArray = [];
  this.edges = [];

};

//constant time complexity O(1)
// Add a node to the graph, passing in the node's value.
Graph.prototype.addNode = function(node) {
  if (!this.data[node]) {
    this.data[node] = [];
    this.nodesArray.push(node);
  }
};


//constant time complexity O(1)
// Return a boolean value indicating if the value passed to contains is represented in the graph.
Graph.prototype.contains = function(item) {
  return this.data[item] ? true : false;
};


//linear time complexity O(n)
// Removes a node from the graph.
Graph.prototype.removeNode = function(node) {
  var refsToRemove = this.data[node];
  delete this.data[node];
  refsToRemove.forEach(function(ref){
    if(this.data[ref].includes(node)){
      var item = this.data[ref].indexOf(node);
      this.data[ref].splice(item, 1);
    }
  }.bind(this));


  var idxToRemove = this.nodesArray.indexOf(node);

  this.nodesArray.splice(idxToRemove, 1);
};


//constant time complexity O(1)
// Returns a boolean indicating whether two specified nodes are connected.  Pass in the values contained in each of the two nodes.
Graph.prototype.hasEdge = function(fromNode, toNode) {
  return this.data[fromNode].includes(toNode);
};


//constant time complexity O(1)
// Connects two nodes in a graph by adding an edge between them.
Graph.prototype.addEdge = function(fromNode, toNode){
  this.data[fromNode].push(toNode);
  this.data[toNode].push(fromNode);
};


//linear time complexity O(n)
// Remove an edge between any two specified (by value) nodes.
Graph.prototype.removeEdge = function(fromNode, toNode) {
  var param1 = this.data[fromNode].indexOf(toNode);
  var param2 = this.data[toNode].indexOf(fromNode);
  delete this.data[fromNode][param2];
  delete this.data[toNode][param1];
};

//linear time complexity O(n)
// Pass in a callback which will be executed on each node of the graph.
Graph.prototype.forEachNode = function(cb) {
  this.nodesArray.forEach(function(node){
    cb(node);
  }.bind(this));
};

let zeNewGraph = new Graph();

let squareNodes = function(el){
  zeNewGraph.addNode(el * el);
};


Graph.prototype.DFSUtil = function(node, visited, visited_data) {
  visited[node] = true;
  if(!visited_data.includes(node)){
    visited_data.push(node);
  }

  this.data[node].forEach((i_node, i) => {
    if(visited[i] === false){
      this.DFSUtil(i_node, visited, visited_data);
    }
  });

  return visited_data;
}


Graph.prototype.DFS = function(node) {
  let visited = Array.from(this.nodesArray, x => x = false);
  let visited_data = [];
  return this.DFSUtil(node, visited, visited_data);
}





g = new Graph();
g.addNode(0);
g.addNode(1);
g.addNode(2);
g.addNode(3);
g.addEdge(0, 1);
g.addEdge(0, 2);
g.addEdge(1, 2);
g.addEdge(2, 0);
g.addEdge(2, 3);
g.addEdge(3, 3);
g.forEachNode(squareNodes)
console.log(zeNewGraph);
g.DFS(2);
