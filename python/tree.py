class Tree:

  def __init__(self, value):
    self.value = value;
    self.children = [];
    self.parent = None;


  def add_child(self, value):
    parent = self;
    child = Tree(value);
    child.parent = parent;
    self.children.append(child);


  def remove_from_parent(self):
    if self.parent:
      child_node_index = self.parent.children.index(self);
      a = list(filter(lambda x: x != self, self.parent.children));
      print("YOOO HIII", a);
      self.parent.children = a;
      self.parent = None;


  def inclusion_check(self, child, target, result):
    if child.value == target:
      result = True;
      return result;
    elif child.value != target and len(child.children) > 0:
      for i in range(len(child.children)):
        return self.inclusion_check(child.children[i], target, result);

    print("RESULT IS: {:b}".format(result));
    return result;


  def contains(self, target):
    result = False;

    if self.value == target:
      result = True;
      print("RESULT IS hi: {:b}".format(result));
      return result;
    elif self.value != target:
      for i in range(len(self.children)):
        return self.inclusion_check(self.children[i], target, result);


    print("RESULT IS hi: {:b}".format(result));
    return result;


  def tree_mapper(self, child, result = []):
    if child.value:
      result.append(child.value);
    elif child.value and len(child.children) > 0:
      for i in range(len(child.children)):
        return self.tree_mapper(child.children[i], result);

    print("RESULT IS: {:s}".format(result));
    return result;


  def traverse(self):
    result = [];
    if self.value:
      result.append(self.value);
      for i in range(len(self.children)):
        self.tree_mapper(self.children[i], result);

    print("RESULT IS: {:s}".format(result));
    return result;





abc = Tree(10);
abc.add_child(15);
abc.add_child(20);
abc.children[1].add_child('COOOOOLLL');
abc.children[0].add_child('YOOOOOOO');
abc.children[1].children[0].add_child('WHAAAAAT?');
print(abc.children[1].children[0].children[0].value)
abc.contains(15);
abc.contains(11);
abc.contains('YOOOOOOO');
abc.children[1].children[0].children[0].remove_from_parent();
print(abc.children[1].children[0].children == []);
print(abc.contains("WHAAAAAT?"));
print(abc.contains('YOOOOOOO'));
abc.traverse();
