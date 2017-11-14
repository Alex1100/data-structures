var Tree = function(value) {
  var newTree = {};
  newTree.value = value;

  // your code here
  newTree.children = [];
  newTree.addChild = treeMethods.addChild;
  newTree.contains = treeMethods.contains;
  newTree.removeFromParent = treeMethods.removeFromParent;
  newTree.traverse = treeMethods.traverse;
  newTree.traverseAndMap = treeMethods.traverseAndMap;

  return newTree;
};

var treeMethods = {};

//constant time complexity O(1)
treeMethods.addChild = function(value) {
  var child = Tree(value);
  child.parent = this;
  this.children.push(child);
};

//what index is the current child node on the tree and also splice that index out from the children array
//take away reference to parent from child
//need to iterate through all children of parent
//find input value and remove it from it's parent



treeMethods.removeFromParent = function(){
  if(this.parent){
    var childNodeindex = this.parent.children.indexOf(this);
    this.parent.children.splice(childNodeIndex);
    this.parent = null;
  }
}



//linear time complexity O(n)
treeMethods.contains = function(target) {
  var result = false;

  var helper = function(child){
    if(child.value === target){
      result = true;
    } else if(child.value !== target && child.children.length > 0){
      for(let j = 0; j < child.children.length; j++){
        helper(child.children[j]);
      }
    }
  };

  if(this.value === target){
    return true;
  } else if(this.value !== target){
    for(let i = 0; i < this.children.length; i++){
      helper(this.children[i]);
    }
  }
  return result;
};



treeMethods.traverse = function(callback){
  var result;

  var helper = function(child){
    if(child.value){
      result = callback(child.value);
    } else if(child.value && child.children.length > 0){
      for(let j = 0; j < child.children.length; j++){
        helper(child.children[j]);
      }
    }
  };

  if(this.value){
    result = callback(this.value);
    for(let i = 0; i < this.children.length; i++){
      helper(this.children[i]);
    }
  }

  return result;
};


treeMethods.traverseAndMap = function(){
  var result = []

  var helper = function(child, result){
    if(child.value){
      result.push(child.value);
    } else if(child.value && child.children.length > 0){
      for(let j = 0; j < child.children.length; j++){
        helper(child.children[j], result);
      }
    }
  };

  if(this.value){
    result.push(this.value);
    for(let i = 0; i < this.children.length; i++){
      helper(this.children[i], result);
    }
  }

  return result;
};


let valArray = [];
var squareIt = function(value) { valArray.push(value*value); };


let abc = new Tree(10);
abc.addChild(15);
abc.addChild(20)
abc.children[0].addChild('YOOOOOOO')
abc.contains(10)
abc.contains(15)
abc.contains(11)
abc.contains('YOOOOOOO')
abc.children[0].children[0].removeFromParent
abc.contains('YOOOOOOO')
abc.traverse(squareIt);
console.log(valArray);
abc.traverseAndMap();
