//ES5 version test
// const {
//   Graph
// } = require('../graph');


// describe("Graph", () => {
//   let leGraph = new Graph();

//   describe("test the addNode method on Graph", () => {
//     it("should add a new node to the graph", () => {
//       leGraph.addNode(9);
//       expect(leGraph.nodesArray[0]).toBe(9);
//     });
//   });

//   describe("tests the contains method on Graph", () => {
//     it("should return true", () => {
//       expect(leGraph.contains(9)).toBe(true);
//     });
//     it("should return false", () => {
//       expect(leGraph.contains(22)).toBe(false);
//     });
//   });

//   describe("tests the removeNode method on Graph", () => {
//     it("should remove selected node from nodesArray", () => {
//       leGraph.removeNode(9);
//       expect(leGraph.nodesArray.length).toBe(0);
//     });
//   });


//   describe("tests the hasEdge, removeEdge, and addEdge method on Graph", () => {
//     it("should return true", () => {
//       leGraph.addNode(9);
//       leGraph.addNode(10);
//       leGraph.addNode(7);
//       leGraph.addNode(6);
//       leGraph.addNode(5);
//       leGraph.addEdge(7, 10);
//       leGraph.addEdge(7, 9);
//       leGraph.addEdge(9, 5);
//       leGraph.addEdge(5, 6);

//       expect(leGraph.hasEdge(7, 9)).toBe(true);
//     });

//     it("should return false", () => {
//       leGraph.removeEdge(5, 6);
//       leGraph.removeEdge(9, 5);
//       leGraph.removeEdge(7, 9);
//       leGraph.removeEdge(10, 7);

//       expect(leGraph.hasEdge(5, 6)).toBe(false);
//     });
//   });

//   describe("tests the forEachNode method on Graph", () => {
//     it("should transform the values of the nodes in nodesArray", () => {
//       let zeNewGraph = new Graph();

//       const cubeNodes = (el) => {
//         zeNewGraph.addNode(el ** 3);
//       };

//       leGraph.forEachNode(cubeNodes);

//       expect(zeNewGraph.nodesArray[0]).toBe(leGraph.nodesArray[0] ** 3);
//     });
//   });

//   describe("tests the Depth First Search method on Graph", () => {
//     it("should return a specific output", () => {
//       leGraph = new Graph();
//       leGraph.addNode(0);
//       leGraph.addNode(1);
//       leGraph.addNode(2);
//       leGraph.addNode(3);
//       leGraph.addEdge(0, 1);
//       leGraph.addEdge(0, 2);
//       leGraph.addEdge(1, 2);
//       leGraph.addEdge(2, 0);
//       leGraph.addEdge(2, 3);
//       leGraph.addEdge(3, 3);

//       expect(leGraph.DFS(2)).toMatchObject([2, 0, 1, 3])
//     })
//   })
// });





//ES6 version Graph
/* eslint-disable no-undef */
const Graph = require('../graph');

describe('Graph', () => {
  let graph;

  beforeEach(() => {
    graph = new Graph();
  });

  it('should have methods named "addVertex", "contains", "removeVertex", "addEdge", "checkIfEdgeExists", and "removeEdge"', () => {
    expect(typeof graph.addVertex).toBe('function');
    expect(typeof graph.contains).toBe('function');
    expect(typeof graph.removeVertex).toBe('function');
    expect(typeof graph.addEdge).toBe('function');
    expect(typeof graph.checkIfEdgeExists).toBe('function');
    expect(typeof graph.removeEdge).toBe('function');
  });

  it('should store values as nodes on the graph', () => {
    graph.addVertex('Hello World!');
    expect(graph.contains('Hello World!')).toBe(true);
  });

  it('should properly remove nodes', () => {
    graph.addVertex('hi there');
    graph.removeVertex('hi there');
    expect(graph.contains('hi there')).toBe(false);
  });

  it('should automatically create an edge between two nodes if there is only two nodes in the graph', () => {
    const pineapple = graph.addVertex('pineapple');
    const banana = graph.addVertex('banana');
    expect(graph.checkIfEdgeExists(pineapple, banana)).toBe(true);
  });

  it('should create edges between two nodes', () => {
    const pineapple = graph.addVertex('pineapple');
    const banana = graph.addVertex('banana');
    const mango = graph.addVertex('mango', pineapple);
    expect(graph.checkIfEdgeExists(pineapple, banana)).toBe(true);
    expect(graph.checkIfEdgeExists(mango, banana)).toBe(false);
    expect(graph.checkIfEdgeExists(mango, pineapple)).toBe(true);
  });

  it('should be able to remove edges connecting two nodes', () => {
    const monkey = graph.addVertex('monkey');
    const human = graph.addVertex('human');
    const crocodile = graph.addVertex('crocodile', [human]);
    graph.addEdge(crocodile, monkey);
    graph.removeEdge(monkey, human);
    expect(graph.checkIfEdgeExists(monkey, human)).toBe(false);
  });

  it('should remove nodes without any edges', () => {
    const A = graph.addVertex('A');
    const b = graph.addVertex('b');
    expect(graph.checkIfEdgeExists(A, b)).toBe(true);
    graph.removeEdge(A, b);
    expect(graph.checkIfEdgeExists(A, b)).toBe(false);
    expect(graph.contains('A') || graph.contains('b')).toBe(false);
  });
});
