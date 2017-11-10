//First In First Out


let Queue = function(){
  this.items = {};
  this.size = 0;
}


//Enqueue Function
//Adds to the end of the queue

Queue.prototype.Enqueue = function(item){
  if(this.size === 0) {
    this.items[0] = item;
    this.size++;
  } else {
    let allItems = Object.keys(this.items).map(el => this.items[el]);
    allItems.unshift(item);

    for(let i = 0; i < allItems.length; i++){
      this.items[i] = allItems[i]
    }

    this.size++;
  }
}


//Dequeue Function
//Adds to the end of the queue

Queue.prototype.Dequeue = function(){
  let firstInQueue;
  let allItems = Object.keys(this.items).map(el => this.items[el]);
  firstInQueue = allItems[allItems.length - 1];
  allItems = allItems.slice(0, allItems.length - 1);

  for(let i = 0; i < allItems.length - 1; i++){
    this.items[i] = allItems[i];
  }

  delete this.items[this.size-1];
  this.size--;

  return firstInQueue;
}



//Contains Function
//Performs a Linear Search to determine if
//The item is within the Queue

Queue.prototype.contains = function(item){
  let found = false;

  Object.keys(this.items).map(el => {
    if(this.items[el] === item){
      found = true;
    }
  });

  return found;
}


//Clear Function
//Removes all items from
//the Queue

Queue.prototype.clear = function(){
  this.items = {};
  this.size = 0;
}


//Peek Function
//Returns the Object
//at the beginning of the Queue
//without removing it

Queue.prototype.peek = function(){
  console.log(this);
  return this.items[this.size - 1];
}


//ToArray Function
//Copies the queue to a new Array

Queue.prototype.ToArray = function(){
  return Object.keys(this.items).map(el => this.items[el]);
}
