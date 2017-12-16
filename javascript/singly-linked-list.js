let SinglyNode = function(data){
  this.data = data;
  this.next = null;
};



let SinglyLinkedList = function(){
  this.head = null;
  this.length = 0;
  this.tail = null;
};


SinglyLinkedList.prototype.removeDupsAndReInitialize = function(){
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

  let freshLL = new SinglyLinkedList();

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


SinglyLinkedList.prototype.add = function(data){
  let newNode = new SinglyNode(data);

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


SinglyLinkedList.prototype.searchByPosition = function(position){
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


SinglyLinkedList.prototype.get = function(input){
  var current = this.head;
  while(current !== null){
    if(current.data === input){
      return current;
    }
    current = current.next;
  }
  return current;
};


SinglyLinkedList.prototype.contains = function(input) {
  return this.get(input) === null ? false : true;
};



SinglyLinkedList.prototype.remove = function(position){
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
    currentNode = nodeToDelete;
    count++;
  }

  beforeNodeToDelete.next = nodeToDelete.next;
  deletedNode = nodeToDelete;
  nodeToDelete = null;
  this.length = this.length - 1;

  return deletedNode;
};


module.exports = {
  SinglyLinkedList,
  SinglyNode
}

