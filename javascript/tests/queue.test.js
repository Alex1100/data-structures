const {
  Queue
} = require('../queue');


describe("Queue", () => {
  let leQueue = new Queue();
  describe("the insert enqueue on Queue", () => {
    it("should add a new node to the queue", () => {
      leQueue.Enqueue(9);
      expect(leQueue.items[0]).toBe(9);
    });
  });
});
