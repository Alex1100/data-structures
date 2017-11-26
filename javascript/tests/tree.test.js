const {
  treeMethods,
  Tree
} = require('../tree');


describe("Tree", () => {
  let leTree = new Tree(10);
  describe("the addChild method on Tree", () => {
    it("should add a new leaf to the tree", () => {
      leTree.addChild(9);
      expect(leTree.children[0].value).toBe(9);
    });
  });
});
