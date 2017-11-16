class Node:
  def __init__(self, data):
    self.data = data;
    self.next_in_line = None;


class LinkedList:


  def __init__(self):
    self.head = None;
    self.tail = None;
    self.length = 0;

  def remove_dups_and_reinitialize(self):
    if self.head == None or self.head.next_in_line == None:
      raise Exception('No duplicates were found. Empty or a single element Linked List.');

    p1 = '';
    p2 = '';
    nodes = {};

    p1 = self.head;
    p2 = p1.next_in_line;
    nodes[p1.data] = [True, p1.data];
    uniq = [p1.data];

    while (p2):
      info = p2.data;
      if info in nodes.values():
        p1.next_in_line = p2.next_in_line;
      else:
        nodes[info] = [True, info];
        uniq.append(info);
        p1 = p2;

      p2 = p2.next_in_line;


    freshLL = LinkedList();


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
      self.tail = self.head;
      self.length = self.length + 1;

      print("NEW NODE IN LINKED LIST IS: {:s}".format(new_node));
      return new_node;
    elif self.head != None:
      current = self.head;

      while(current.next_in_line):
        current = current.next_in_line;

      current.next_in_line = new_node;
      self.tail = current.next_in_line;
      self.length = self.length + 1;

      print("NEW NODE IN LINKED LIST IS: {:s}".format(new_node));
      return new_node;



  def search_by_position(self, position):
    current_node = self.head;
    leng = self.length;
    count = 1;
    message = 'Non-Existent Node';


    print("LEN IS: ", leng);

    if leng == 0 or position < 1 or position > leng:
      raise Exception(message);

    while(count < position):
      current_node = current_node.next_in_line;
      count = count + 1;

    if type(current_node.data) == int:
      print("CURRENT NODE IN LINKED LIST IS: {:d}".format(current_node.data));
    else:
      print("CURRENT NODE IN LINKED LIST IS: {:s}".format(current_node.data));

    return current_node;

  def get_item(self, input):
    current = self.head
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
    if self.get_item(input) == None:
      print("CAN'T REMOVE BECAUSE {:s} IS NOT INCLUDED IN LINKED LIST".format(input));
      return None;

    if self.head.data == input:
      self.head = self.head.next_in_line;
      return;

    node = self.find_before(input);
    removed_node = node.next_in_line;
    node.next_in_line = node.next_in_line.next_in_line;

    if type(removed_node) == int:
      print("REMOVED NODE {:s} AND IT'S DATA IS: {:d}".format(remove_noe, removed_node.data));
    else:
      print("REMOVED NODE {:s} AND IT'S DATA IS: {:s}".format(removed_node, removed_node.data));



  def find_before(self, input):
    node = self.head;

    if not node.next_in_line:
      return False;

    if node.next_in_line.data == input:
      print("GOT HERE AND NODE IS: ", node);
      return node;

    while (node.next_in_line):
      node = node.next_in_line;
      if node.next_in_line and node.next_in_line.data == input:
        print("GOT HERE WOAH AND NODE IS: ", node);
        return node;


  def remove_by_position(self, position):
    current_node = self.head;
    leng = self.length;
    count = 0;
    message = 'Non-Existent Node';
    before_node_to_delete = None;
    node_to_delete = None;
    deleted_node = None;


    if(position < 0 or position > leng):
      raise Exception(message);

    if(position == 1):
      self.head = current_node.next_in_line;
      deleted_node = current_node;
      current_node = None;
      self.length = self.length - 1;

      print("REMOVED NODE FROM LINKED LIST IS: {:s}".format(deleted_node));
      return deleted_node;

    while(count < position):
      before_node_to_delete = current_node;
      node_to_delete = current_node.next_in_line;
      count = count + 1;

    before_node_to_delete.next_in_line = node_to_delete.next_in_line;
    deleted_node = node_to_delete;
    node_to_delete = None;
    self.length = self.length - 1;

    if type(deleted_node.data) == int:
      print("REMOVED NODE FROM LINKED LIST IS: {:s} AND IT'S DATA IS {:d}".format(deleted_node, deleted_node.data));
    else:
      print("REMOVED NODE FROM LINKED LIST IS: {:s} AND IT'S DATA IS {:s}".format(deleted_node, deleted_node.data));

    return deleted_node;




abc = LinkedList();
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
abc.remove_by_position(20);
abc.contains(13);
