class Queue:

  def __init__(self):
    self.items = {};
    self.size = 0;


  def enqueue(self, item):
    if self.size == 0:
      self.items[0] = item;
      self.size = self.size + 1;
    else:
      all_items = self.items.values();
      all_items = [item] + all_items;
      self.size = self.size + 1;

      for i in range(len(all_items)):
        self.items[i] = all_items[i];


  def dequeue(self):
    first_in_queue = '';
    all_items = self.items.values();
    first_in_queue = all_items[len(all_items) - 1];
    upto = len(all_items) - 1;
    ze_items = all_items[0:upto];

    for i in range(len(ze_items)):
      self.items[i] = ze_items[i];

    del self.items[(self.size - 1)];
    self.size = self.size - 1;

    if type(first_in_queue) == int:
      print("FIRST IN QUEUE IS {:d}".format(first_in_queue));
    else:
      print("FIRST IN QUEUE IS {:s}".format(first_in_queue));
    return first_in_queue;


  def contains(self, item):
    print(len(list(filter(lambda x: x == item, self.items.values()))) > 0)
    return len(list(filter(lambda x: x == item, self.items.values()))) > 0;



  def clear(self):
    self.items = {};
    self.size = 0;


  def peek(self):
    print(self.items[self.size - 1]);
    return self.items[self.size - 1];


  def to_array(self):
    print(self.items.values());
    return self.items.values();




abc = Queue();
print(abc);
abc.enqueue(1);
abc.enqueue(2);
abc.enqueue(3);
print("\n\n\n\n", abc)
abc.dequeue();
print(abc.items)
abc.contains(2);
abc.peek();
abc.to_array();
