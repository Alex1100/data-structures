const {
  Graph
} = require('../graph');


describe("Graph", () => {
  let leGraph = new Graph();

  describe("test the addNode method on Graph", () => {
    it("should add a new node to the graph", () => {
      leGraph.addNode(9);
      expect(leGraph.nodesArray[0]).toBe(9);
    });
  });

  describe("tests the contains method on Graph", () => {
    it("should return true", () => {
      expect(leGraph.contains(9)).toBe(true);
    });
    it("should return false", () => {
      expect(leGraph.contains(22)).toBe(false);
    });
  });

  describe("tests the removeNode method on Graph", () => {
    it("should remove selected node from nodesArray", () => {
      leGraph.removeNode(9);
      expect(leGraph.nodesArray.length).toBe(0);
    });
  });


  describe("tests the hasEdge, removeEdge, and addEdge method on Graph", () => {
    it("should return true", () => {
      leGraph.addNode(9);
      leGraph.addNode(10);
      leGraph.addNode(7);
      leGraph.addNode(6);
      leGraph.addNode(5);
      leGraph.addEdge(7, 10);
      leGraph.addEdge(7, 9);
      leGraph.addEdge(9, 5);
      leGraph.addEdge(5, 6);

      expect(leGraph.hasEdge(7, 9)).toBe(true);
    });

    it("should return false", () => {
      leGraph.removeEdge(5, 6);
      leGraph.removeEdge(9, 5);
      leGraph.removeEdge(7, 9);
      leGraph.removeEdge(10, 7);

      expect(leGraph.hasEdge(5, 6)).toBe(false);
    });
  });

  describe("tests the forEachNode method on Graph", () => {
    it("should transform the values of the nodes in nodesArray", () => {
      let zeNewGraph = new Graph();

      const cubeNodes = (el) => {
        zeNewGraph.addNode(el ** 3);
      };

      leGraph.forEachNode(cubeNodes);

      expect(zeNewGraph.nodesArray[0]).toBe(leGraph.nodesArray[0] ** 3);
    });
  });

  describe("tests the Depth First Search method on Graph", () => {
    it("should return a specific output", () => {
      leGraph = new Graph();
      leGraph.addNode(0);
      leGraph.addNode(1);
      leGraph.addNode(2);
      leGraph.addNode(3);
      leGraph.addEdge(0, 1);
      leGraph.addEdge(0, 2);
      leGraph.addEdge(1, 2);
      leGraph.addEdge(2, 0);
      leGraph.addEdge(2, 3);
      leGraph.addEdge(3, 3);

      expect(leGraph.DFS(2)).toMatchObject([2, 0, 1, 3])
    })
  })
});
