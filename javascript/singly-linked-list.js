let Node = function(data){
  this.data = data;
  this.next = null;
};



let LinkedList = function(){
  this.head = null;
  this.length = 0;
  this.tail = null;
};


LinkedList.prototype.removeDupsAndReInitialize = function(){
  if (!this.head || !this.head.next) {
    throw new Error('No duplicates were found. Empty or a single element Linked List.');
  }

  var p1;
  var p2;
  var nodes = {};

  p1 = this.head;
  p2 = p1.next;
  nodes[p1.data] = [true, p1.data];
  var uniq = [p1.data];

  while (p2) {
    var data = p2.data;
    if (nodes[data]) {
        p1.next = p2.next;
    } else {
        nodes[data] = [true, data];
        uniq.push(data);
        p1 = p2;
    }
    p2 = p2.next;
  }

  let freshLL = new LinkedList();

  for(let i = 0; i < uniq.length; i++){
    freshLL.add(uniq[i]);
  }

  this.head = null;
  this.length = null;
  this.tail = null;
  delete this.head;
  delete this.tail;
  delete this.length;
  console.log("UNIQ POSITIONS ARE: ", uniq);

  return freshLL;
};


LinkedList.prototype.add = function(data){
  let newNode = new Node(data);

  if(this.head === null){
    this.head = newNode;
    this.tail = this.head;
    this.length++;

    return newNode;
  }

  let current = this.head;

  while(current.next !== null){
    current = current.next;
  }

  current.next = newNode;
  this.tail = current.next;
  this.length++;
  return newNode;
};


LinkedList.prototype.searchByPosition = function(position){
  let currentNode = this.head;
  let length = this.length;
  let count = 1;
  let message = {"failure": 'Non-Existent Node'};

  if(length === 0 || position < 1 || position > length) {
    throw new Error(message.failure);
  }

  while(count < position){
    currentNode = currentNode.next;
    count++;
  }

  return currentNode;
};


LinkedList.prototype.contains = function(target) {
    var status = false;
    if(this.head === null){
      return status;
    } else if(this.head !== null){
      var current = this.head;
      while(current.next !== null){
        if(this.head.data === target){
        return true;
      }
      current = current.next;
      if(current.data === target){
        status = true;
        return status;
      } else {
        return false;
      }
    }
    return status;
  }
};



LinkedList.prototype.remove = function(position){
  let currentNode = this.head;
  let length = this.length;
  let count = 0;
  let message = {"failure": 'Non-Existent Node'};
  let beforeNodeToDelete = null;
  let nodeToDelete = null;
  let deletedNode = null;


  if(position < 0 || position > length){
    throw new Error(message.failure);
  }

  if(position === 1){
    this.head = currentNode.next;
    deletedNode = currentNode;
    currentNode = null;
    this.length--;

    return deletedNode;
  }

  while(count < position) {
    beforeNodeToDelete = currentNode;
    nodeToDelete = currentNode.next;
    count++;
  }

  beforeNodeToDelete.next = nodeToDelete.next;
  deletedNode = nodeToDelete;
  nodeToDelete = null;
  this.length = this.length - 1;

  return deletedNode;
};

