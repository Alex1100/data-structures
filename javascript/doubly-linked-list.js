let Node = function(data){
  this.data = data;
  this.next = null;
}



let LinkedList = function(){
  this.head = null;
  this.length = 0;
  this.tail = null;
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
  let count = 0;

  while(current.next !== null){
    if(count > 0){
      current.prev = current;
    } else {
      current.prev = null;
    }
    current = current.next;
    current.prev.next.next = current;
    count++;
  }

  current.next = newNode;
  current.next.prev = Object.assign({}, current);
  this.tail = current.next;
  this.tail.prev.next = Object.assign({}, current.next);
  this.length++;
  return newNode;
};


LinkedList.prototype.search = function(position){
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
  this.length--;

  return deletedNode;
};
