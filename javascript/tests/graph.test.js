const {
  Graph
} = require('../graph');


describe("Graph", () => {
  let leGraph = new Graph();
  describe("test the add_node method on Graph", () => {
    it("should add a new node to the graph", () => {
      leGraph.addNode(9);
      expect(leGraph.nodesArray[0]).toBe(9);
    });
  });
});
