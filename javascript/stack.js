//Last In Last Out

let Stack = function() {
  this.items = {};
  this.size = 0;
}


//Push Function
//Inserts a new object
//to the top of the stack
//without returning it

Stack.prototype.push = function(item){
  if(this.size === 0) {
    this.items[this.size] = item;
    this.size++;

  } else {
    let allItems = Object.keys(this.items).map(el => this.items[el]);
    allItems.unshift(item);
    this.size++;

    for(let i = 0; i < allItems.length; i++){
      this.items[i] = allItems[i]
    }
  }
}


//Pop Function
//Removes and returns the
//object at the top of the stack

Stack.prototype.pop = function(){
  let topObject;

  let allItems = Object.keys(this.items).map((el, i) => {
    if(i !== 0){
      return this.items[el]
    } else {
      topObject = this.items[el];
    }
  });

  allItems.shift();

  for(let z = 0; z < allItems.length; z++){
    this.items[z] = allItems[z];
  }

  delete this.items[this.size - 1];
  this.size--;

  return topObject;
}


//Peek Function
//Returns the object at the top
//of the stack without removing
//it

Stack.prototype.peek = function(){
  return this.items[0];
}


//ToArray Function
//Copies the stack to a new Array

Stack.prototype.ToArray = function(){
  return Object.keys(this.items).map(el => this.items[el]);
}


//isEmpty Function
//Checks to see if stack is
//empty

Stack.prototype.isEmpty = function(){
  return this.size === 0 ? true : false;
}


//Clear Function
//Removes all objects from
//The stack
Stack.prototype.clear = function(){
  this.items = {};
  this.size = 0;
}


//StackSize Function
//Returns the size of the
//current stack

Stack.prototype.stackSize = function(){
  return this.size;
}
