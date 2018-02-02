package main

import (
	"fmt"
)

type bst *BinarySearchTree

type BinarySearchTree struct {
	ValueInfo  string
	Value      int
	ValueComma string
	LeftInfo   string
	Left       *BinarySearchTree
	LeftComma  string
	RightInfo  string
	Right      *BinarySearchTree
}

func InitBinarySearchTree(key int) *BinarySearchTree {
	return &BinarySearchTree{
		ValueInfo:  "Value:",
		Value:      key,
		ValueComma: ",",
		LeftInfo:   "Left:",
		Left:       nil,
		LeftComma:  ",",
		RightInfo:  "Right:",
		Right:      nil,
	}
}

func (b *BinarySearchTree) Insert(key int) {
	if key < b.Value {
		if b.Left == nil {
			b.Left = InitBinarySearchTree(key)
		} else {
			b.Left.Insert(key)
		}
	} else if key > b.Value {
		if b.Right == nil {
			b.Right = InitBinarySearchTree(key)
		} else {
			b.Right.Insert(key)
		}
	}
}

func recurse(result bool, node *BinarySearchTree, input int) bool {
	if node == nil {
		return result
	}

	if input == node.Value {
		result = true
	} else if input < node.Value {
		return recurse(result, node.Left, input)
	} else if input > node.Value {
		return recurse(result, node.Right, input)
	}

	return result
}

func (b *BinarySearchTree) Contains(input int) bool {
	result := false

	if input == b.Value {
		result = true
	} else if input < b.Value && b.Left != nil {
		result = recurse(result, b.Left, input)
	} else if input > b.Value && b.Right != nil {
		result = recurse(result, b.Right, input)
	}

	return result
}

func (b *BinarySearchTree) DepthFirstToArray(v []int) []int {
	if b.Value <= 0 || b.Value > 0 {
		v = append(v, b.Value)
	}

	if b.Left != nil {
		v = b.Left.DepthFirstToArray(v)
	}

	if b.Right != nil {
		v = b.Right.DepthFirstToArray(v)
	}

	return v
}

func (b *BinarySearchTree) BreadthFirstToArray(v []int) []int {
	var current []bst
	var next []bst
	current = make([]bst, 0)
	current = append(current, b)

	for len(current) > 0 {
		next = make([]bst, 0)

		for _, node := range current {

			v = append(v, node.Value)

			if node.Left != nil {
				next = append(next, node.Left)
			}

			if node.Right != nil {
				next = append(next, node.Right)
			}
		}
		current = next
	}

	return v
}

func main() {
	bt := InitBinarySearchTree(100)
	fmt.Println(bt)
	bt.Insert(10)
	fmt.Println(bt)
	bt.Insert(110)
	bt.Insert(20)
  bt.Insert(-10)
  bt.Insert(-11)
  bt.Insert(6)
	bt.Insert(5)
	bt.Insert(135)
	fmt.Println(bt.Contains(20))
	fmt.Println(bt.Contains(19))
	fmt.Println(bt.DepthFirstToArray(make([]int, 0)))
	fmt.Println(bt.BreadthFirstToArray(make([]int, 0)))
}
