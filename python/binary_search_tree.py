class BinarySearchTree:

  def __init__(self, value):
    self.value = value;
    self.left = None;
    self.right = None;
    self.level = 0;

  def insert(self, input):
    subject = self;
    if input < subject.value:
      if subject.left == None:
        subject.left = BinarySearchTree(input);
        subject.left.level = subject.level + 1;
      else:
        subject.left.insert(input);
    elif input > subject.value:
      if subject.right == None:
        subject.right = BinarySearchTree(input);
        subject.right.level = subject.level + 1;
      else:
        subject.right.insert(input);



  def inclusion_check(self, input, result):
    subject = self;
    if input == subject.value:
      result = True;
      print("RESULT IS ", result);
      return result;
    elif input < subject.value:
      if subject.left != None:
        subject.left.inclusion_check(input, result);
      else:
        print("RESULT IS ", result);
        return result;
    elif input > subject.value:
      if subject.right != None:
        subject.right.inclusion_check(input, result);
      else:
        print("RESULT IS ", result);
        return result;


  def contains(self, input):
    result = False;
    return self.inclusion_check(input, result)


  def DFS_To_Array(self, input = None, vals = []):
    subject = self;

    if subject.value:
      vals.append(subject.value);

    if subject.left:
      input = subject.left.value;
      subject.left.DFS_To_Array(input, vals);

    if subject.right:
      input = subject.right.value;
      subject.right.DFS_To_Array(input, vals);

    return vals;


  def BFS_To_Array(self, vals = []):
    subject = self;
    current = [subject];

    while len(current) > 0:
      next_nodes = [];

      for node in current:
        vals.append(node.value);

        if node.left:
          next_nodes.append(node.left);

        if node.right:
          next_nodes.append(node.right);


      current = next_nodes;

    print(vals);
    return vals;

coolTree = BinarySearchTree(10);
coolTree.insert(9);
coolTree.insert(6);
coolTree.insert(5);
coolTree.insert(8);
coolTree.contains(10);
coolTree.insert(15);
coolTree.insert(13);
coolTree.insert(20);
coolTree.insert(11);
coolTree.insert(12);
print("Tree root's right leaf's right leaf value is {:d}".format(coolTree.right.right.value));
print("Tree root's left leaf's value is {:d}".format(coolTree.left.value));
print(coolTree.DFS_To_Array())
coolTree.BFS_To_Array()
