let CircularDoublyNode = function(data){
  this.data = data;
  this.next = null;
};


let CircularDoublyLinkedList = function(){
  this.head = null;
  this.length = 0;
  this.tail = null;
};


CircularDoublyLinkedList.prototype.removeDupsAndReInitialize = function(){
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
    if(p2 === this.head){
      p2 = false;
    }
  }

  let freshLL = new CircularDoublyLinkedList();

  for(let i = 0; i < uniq.length; i++){
    freshLL.add(uniq[i]);
  }

  this.head = null;
  this.length = null;
  this.tail = null;
  delete this.head;
  delete this.tail;
  delete this.length;

  return freshLL;
};


CircularDoublyLinkedList.prototype.add = function(data){
  let newNode = new CircularDoublyNode(data);

  if(this.head === null){
    this.head = newNode;
    this.head.prev = null;
    this.head.next = null;
    this.tail = null;
    this.length++;

    return newNode;
  }

  let current = this.head;

  while(current.next !== null && current.next !== this.head){
    current = current.next;
  }

  current.next = newNode;
  current.next.prev = current;
  current = current.next;
  this.tail = current;
  this.tail.next = this.head;
  this.length++;
  return newNode;
};


CircularDoublyLinkedList.prototype.searchByPosition = function(position){
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


CircularDoublyLinkedList.prototype.get = function(input){
  let current = this.head;
  while(current !== null){
    if(current.data === input){
      return current;
    }
    current = current.next;
    if(current === this.head){
      current = null;
    }
  }
  return current;
};


CircularDoublyLinkedList.prototype.contains = function(input) {
  return this.get(input) !== null ? true : false;
};


CircularDoublyLinkedList.prototype.removeByInput = function(input){
  var target = this.get(input);
  if(target === null){
    return target;
  }

  //case for when linked list length > 2
  if(target.next !== null){
    var nextNode = target.next;
    nextNode.prev = target.prev;

    if(target.prev !== null){
      target.prev.next = nextNode;
    } else {
      this.head = nextNode;
    }
  } else {
    if(target.prev === null){
      this.head = null;
    } else {
      target.prev.next = null;
      this.tail = target.prev;
      this.tail.next = this.head;
    }
  }

  this.length--;
  return target;
}

module.exports = {
  CircularDoublyLinkedList,
  CircularDoublyNode
}
