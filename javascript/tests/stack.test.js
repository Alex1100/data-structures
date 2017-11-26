const {
  Stack
} = require('../stack');


describe("Stack", () => {
  let leStack = new Stack();
  describe("the push method on Stack", () => {
    it("should push a new item to the stack", () => {
      leStack.push(9);
      expect(leStack.items[0]).toBe(9);
    });
  });
});
