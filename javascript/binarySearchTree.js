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

binarySearchTreeMethods.breadthFirstLog = function(input){

};


//Works if only the level sorting matters. If levelled and left to right or right left then this implementation doesn't follow left to right ordering pattern or right to left ordering pattern;
binarySearchTreeMethods.BFSToArray = function(input, vals = [], level = 0, nextNodes = [], seen = {}, maxLen = this.DFSToArray().length) {

  if(Object.values(seen).length === maxLen){
    return;
  }

  if(level > 0){
    nextNodes = nextNodes.slice(level, level*2);
    level++;
  } else {
    input = this;
  }


  if(input.value){
    if(seen[input.value] === undefined){
      vals.push(input.value);
      seen[input.value] = input.value;
      if(level === 0){
        level++;
      }
    }
  }

  if(input.left){
    nextNodes.push(input.left);
  }

  if(input.right){
    nextNodes.push(input.right);
  }


  nextNodes.forEach((node, i) => {
     return this.BFSToArray(input = node, vals, level, nextNodes, seen);
  });

  return vals;
};


//all operations on a binary search tree are linear
let valArray = [];
var func = function(value) { valArray.push(value*value); };

let BST = new BinarySearchTree(9);
BST.insert(6);
BST.insert(5);
BST.insert(8);
BST.contains(5);
BST.insert(15);
BST.insert(13);
BST.insert(20);
BST.contains(20);
BST.DFSToArray();
BST.DFSEach(func);
BST.DFSToArray()
console.log(valArray);
BST.BFSToArray();
