//functional-shared

var BinarySearchTree = function(value) {
  var newBinarySearchTree = {};
  newBinarySearchTree.value = value;
  newBinarySearchTree.left;
  newBinarySearchTree.right;
  newBinarySearchTree.level = 0;


  newBinarySearchTree.insert = binarySearchTreeMethods.insert;
  newBinarySearchTree.contains = binarySearchTreeMethods.contains;
  newBinarySearchTree.depthFirstLog = binarySearchTreeMethods.depthFirstLog;
  newBinarySearchTree.breadthFirstLog = binarySearchTreeMethods.breadthFirstLog;

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

  var inclusionCheck = function(input) {
    if(input === this.value){
      result = true;
    } else if(input < this.value){
      inclusionCheck.call(this.left, input);
    } else if(input > this.value){
      inclusionCheck.call(this.right, input);
    }
  };
  inclusionCheck.call(this, input);
  return result;
};

//linear time complexity O(n)
binarySearchTreeMethods.DFS = function(input){
  if(this.value){
    input(this.value);
  }
  if(this.left){
    this.left.DFS(input);
  }

  if(this.right){
    this.right.DFS(input);
  }
};

binarySearchTreeMethods.breadthFirstLog = function(input){

};



let valuesArray = [];
var cbFunc = function(value) { valuesArray.push(value); };

let BST = new BinarySearchTree(9);
BST.insert(6)
BST.insert(5)
BST.insert(8)
BST.contains(5)
BST.insert(15)
BST.insert(13)
BST.insert(20)
BST.contains(20)
BST.DFS(cbFunc);
