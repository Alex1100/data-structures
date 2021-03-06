//functional-shared

var BinarySearchTree = function(value) {
  var newBinarySearchTree = {};
  newBinarySearchTree.value = value;
  newBinarySearchTree.left;
  newBinarySearchTree.right;
  newBinarySearchTree.level = 0;


  newBinarySearchTree.insert = binarySearchTreeMethods.insert;
  newBinarySearchTree.contains = binarySearchTreeMethods.contains;
  newBinarySearchTree.DFSEach = binarySearchTreeMethods.DFSEach;
  newBinarySearchTree.DFSToArray = binarySearchTreeMethods.DFSToArray;
  newBinarySearchTree.BFSEach = binarySearchTreeMethods.BFSEach;
  newBinarySearchTree.BFSToArray = binarySearchTreeMethods.BFSToArray;

  return newBinarySearchTree;
};

var binarySearchTreeMethods = {};

//constant time complexity O(1)
binarySearchTreeMethods.insert = function(input){
    if(input < this.value){
      if(!this.left) {
        this.left = BinarySearchTree(input);
      } else {
        this.left.insert(input);
      }
  } else if(input > this.value){
    if (!this.right) {
      this.right = BinarySearchTree(input);
    } else {
      this.right.insert(input);
    }
  }
};

//linear time complexity O(n)
binarySearchTreeMethods.contains = function(input){
  var result = false;

  var helper = function(input) {
    if(input === this.value){
      result = true;
    } else if(input < this.value){
      helper.call(this.left, input);
    } else if(input > this.value){
      helper.call(this.right, input);
    }
  };
  helper.call(this, input);
  return result;
};


//linear time complexity O(n)
binarySearchTreeMethods.DFSEach = function(input){
  if(this.value){
    input(this.value);
  }
  if(this.left){
    this.left.DFSEach(input);
  }

  if(this.right){
    this.right.DFSEach(input);
  }
};

//linear time complexity O(n)
binarySearchTreeMethods.DFSToArray = function(input, vals = []){
  if(this.value){
    vals.push(this.value);
  }
  if(this.left){
    this.left.DFSToArray(input, vals);
  }

  if(this.right){
    this.right.DFSToArray(input, vals);
  }
  return vals;
};


binarySearchTreeMethods.BFSEach = function(cb) {
  var current = [this];

  while (current.length > 0) {

    var next = [];

    for (var node of current) {

      cb(node);

      if (node.left) {
        next.push(node.left);
      }
      if (node.right) {
        next.push(node.right);
      }

    current = next;
    }
  }
}

binarySearchTreeMethods.BFSToArray = function(vals = []){
  let current = [this];

  while(current.length > 0){

    let next = [];

    for(var node of current) {
      vals.push(node.value);

      if(node.left){
        next.push(node.left);
      }

      if(node.right){
        next.push(node.right);
      }

    }

    current = next;
  }

  return vals;
};


let valArray = [];
let listArray = [];
var squareIt = function(value) { valArray.push(value*value); };
var listNodes = function(node) { listArray.push(node.value);};

let BST = new BinarySearchTree(10);
BST.insert(9);
BST.insert(6);
BST.insert(5);
BST.insert(8);
BST.contains(5);
BST.insert(15);
BST.insert(13);
BST.insert(20);
BST.contains(20);
BST.DFSToArray();
BST.DFSEach(squareIt);
console.log(valArray)
BST.DFSToArray()
console.log(valArray);
BST.BFSToArray();
BST.BFSEach(listNodes);
console.log(listArray);


module.exports = {
  binarySearchTreeMethods,
  BinarySearchTree
}
