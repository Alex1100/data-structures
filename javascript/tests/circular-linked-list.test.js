const {
  CircularDoublyNode,
  CircularDoublyLinkedList
} = require('../circular-linked-list');


describe("CircularDoublyLinkedList", () => {
  let cdll = new CircularDoublyLinkedList(10);
  describe("tests the add method on CircularDoublyLinkedList", () => {
    it("should add a new node to the list", () => {
      cdll.add(9);
      expect(cdll.head.data).toBe(9);
    });
  });
});
