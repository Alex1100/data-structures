class Node:

  def __init__(self, data):
    self.data = data;
    self.next_in_line = None;
    self.prev = None;



class DoublyLinkedList:

  def __init__(self):
    self.head = None;
    self.tail = None;
    self.length = 0;


  def remove_dups_and_reinitialize(self):
    if not self.head or not self.head.next_in_line:
      raise Exception('No duplicates were found. Empty or a single element Linked List.');

    p1 = '';
    p2 = '';
    nodes = {};

    p1 = self.head
    p2 = p1.next_in_line;
    nodes[p1.data] = [True, p1.data];
    uniq = [p1.data];

    while (p2):
      info = p2.data
      if info in nodes.values():
        p1.next_in_line = p2.next_in_line;
      else:
        nodes[info] = [True, info];
        uniq.append(info);
        p1 = p2;

      p2 = p2.next_in_line;

    freshLL = DoublyLinkedList();

    for i in range(len(uniq)):
      freshLL.add(uniq[i]);

    self.head = None;
    self.length = None;
    self.tail = None;

    print("NEW LINKEDLIST IS: {:s}".format(freshLL));
    return freshLL;


  def add(self, data):
    new_node = Node(data);

    if self.head == None:
      self.head = new_node;
      self.head.prev = None;
      self.head.next_in_line = None;
      self.tail = self.head;
      self.length = self.length + 1;

      print("NEW NODE IN LINKED LIST IS: {:s}".format(new_node));
      return new_node;

    current = self.head;

    while current.next_in_line != None:
      current = current.next_in_line;

    current.next_in_line = new_node;
    current.next_in_line.prev = current;
    current = current.next_in_line;
    self.tail = current;
    self.length = self.length + 1;

    print("NEW NODE IN LINKED LIST IS: {:s}".format(new_node));
    return new_node;


  def search_by_position(self, position):
    current_node = self.head;
    leng = self.length;
    count = 1;
    message = 'Non-Existent Node';

    if leng == 0 or position < 1 or position > leng:
      raise Exception(message);

    while count < position:
      current_node = current_node.next_in_line;
      count = count + 1;

    if type(current_node.data) == int:
      print("CURRENT NODE IN LINKED LIST IS: {:d}".format(current_node.data));
    else:
      print("CURRENT NODE IN LINKED LIST IS: {:s}".format(current_node.data));

    return current_node;


  def get_item(self, input):
    current = self.head;

    while current != None:
      if current.data == input:
        print("LINKED LIST CURRENTLY IS: {:s}".format(current));
        return current;

      current = current.next_in_line;

    print("LINKED LIST CURRENTLY IS: {:s}".format(current));
    return current;


  def contains(self, input):
    result = False;
    result = self.get_item(input) != None;
    if result == True:
      if type(input) == int:
        print("YES, CONTAINS {:d}. 1 = True and 0 = False: RESULT IS: {:b}".format(input, result));
      else:
        print("YES, CONTAINS {:s}. 1 = True and 0 = False: RESULT IS: {:b}".format(input, result));

      return result;

    print("NO, DOES NOT CONTAIN {:s}, {:b}".format(input, result));
    return result;


  def remove_by_input(self, input):
    target = self.get_item(input);
    if target == None:
      print("CAN'T REMOVE BECAUSE {:s} IS NOT INCLUDED IN LINKED LIST".format(input));
      return None;

    #case for when linked list length > 2
    if target.next_in_line != None:
      next_node = target.next_in_line;
      next_node.prev = target.prev;

      if target.prev != None:
        target.prev.next_in_line = next_node;
      else:
        self.head = next_node;
    else:
      if target.prev == None:
        self.head = None;
      else:
        target.prev.next_in_line = None;
        self.tail = target.prev;


    self.length = self.length - 1;
    if type(target.data) == int:
      print("REMOVED NODE {:s} AND IT'S DATA IS: {:d}".format(target, target.data));
    else:
      print("REMOVED NODE {:s} AND IT'S DATA IS: {:s}".format(target, target.data));



abc = DoublyLinkedList();
abc.add(1);
abc.add(2);
abc.add(3);
abc.add(4);
abc.add(5);
abc.add(7);
abc.add(7);
abc.add(7);
abc.add(7);
abc.add(7);
abc.add(8);
abc.add(9);
abc.add(9);
abc.add(10);
abc.add(111);
abc.add(12);
abc.add(13);
abc.add(13);
abc.add(14);
abc.add(15);
abc.add('hi');
print("\n\n\n\n\n");
print(abc.length);
abc = abc.remove_dups_and_reinitialize();
abc.search_by_position(21);
print("CHECK IT OUT ", abc.get_item('hi'));
abc.remove_by_input('hi');
abc.contains(13);

