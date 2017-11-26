const {
  SinglyLinkedList,
  SinglyNode
} = require('../singly-linked-list');


describe("SinglyLinkedList", () => {
  let sll = new SinglyLinkedList();
  describe("the insert add on SinglyLinkedList", () => {
    it("should add a new node to the list", () => {
      sll.add(9);
      expect(sll.head.data).toBe(9);
    });
  });
});
