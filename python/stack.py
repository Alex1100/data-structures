
class Stack:

  def __init__(self):
    self.items = {};
    self.size = 0;


  def push(self, item):
    if self.size == 0:
      self.items[0] = item;
      self.size = self.size + 1;
    else:
      all_items = list(self.items.values());
      all_items = [item] + all_items
      self.size = self.size + 1;

      for i in range(len(all_items)):
        self.items[i] = all_items[i];


  def pop(self):
    top_object = '';
    all_items = list(self.items.values());
    top_object = all_items[0];
    print("ALL ITEMS ARE: {:s}".format(all_items));
    ze_items = all_items[1:]
    print("ZE ITEMS ARE: {:s}".format(ze_items));

    for i in range(len(ze_items)):
      self.items[i] = ze_items[i];

    del self.items[self.size - 1];
    self.size = self.size - 1;
    print("TOP OBJECT IS {:d}".format(top_object));
    return top_object;



  def peek(self):
    print(self.items[0]);
    return self.items[0];


  def is_empty(self):
    if self.size == 0:
      print(True);
      return True;
    else:
      print(False);
      return False;


  def clear(self):
    self.items = {};
    self.size = 0;
    return self;


  def stack_size(self):
    print(self.size);
    return self.size;


  def to_list(self):
    if self.size == 0:
      print([]);
      return [];
    else:
      print(list(self.items.values()));
      return list(self.items.values());



coolStack = Stack();
print(coolStack)
coolStack.push(10);
coolStack.push(33);
coolStack.push(12);
coolStack.peek();
coolStack.pop();
coolStack.is_empty();
coolStack.stack_size();
coolStack.to_list();
coolStack.clear();
coolStack.to_list();
