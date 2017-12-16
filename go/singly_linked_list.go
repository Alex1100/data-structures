package main

import (
	"fmt"
)

type SinglyNode struct {
	ValueInfo  string
	Value      interface{}
	ValueComma string
	NextInfo   string
	Next       *SinglyNode
}

type SinglyLinkedList struct {
	HeadInfo  string
	Head      *SinglyNode
	HeadComma string
	TailInfo  string
	Tail      *SinglyNode
	TailComma string
	Length    int
}

func InitNode(key interface{}) *SinglyNode {
	return &SinglyNode{
		ValueInfo:  "Value:",
		Value:      key,
		ValueComma: ",",
		NextInfo:   "Next:",
		Next:       nil,
	}
}

func InitSinglyLikedList(key interface{}) *SinglyLinkedList {
	newNode := InitNode(key)
	return &SinglyLinkedList{
		HeadInfo:  "Head:",
		Head:      newNode,
		HeadComma: ",",
		TailInfo:  "Tail:",
		Tail:      newNode,
		TailComma: ",",
		Length:    1,
	}
}

func (s *SinglyLinkedList) AddToList(key interface{}) {
	newNode := InitNode(key)

	if s.Length == 1 {
		s.Head.Next = newNode
		s.Tail = newNode
		s.Length += 1
	} else {
		c := s.Head
		for c.Next != nil {
			c = c.Next
		}
		c.Next = newNode
		s.Tail = newNode
		s.Length += 1
	}
}

func (s *SinglyLinkedList) SearchByPosition(position int) interface{} {
	currentNode := s.Head
	count := 1
	if s.Length == 0 || position < 1 || position > s.Length {
		return "Non-Existent Node"
	}

	for count < position {
		currentNode = currentNode.Next
		count++
	}

	return currentNode
}

func (s *SinglyLinkedList) Get(key interface{}) interface{} {
	current := s.Head

	for current != nil {
		if current.Value == key {
			return current
		}

		current = current.Next
	}

	if current == nil {
		return "Non-Existent Node"
	}

	return current
}

func (s *SinglyLinkedList) Contains(key interface{}) bool {
	if s.Get(key) == "Non-Existent Node" {
		return false
	} else {
		return true
	}
}

func (s *SinglyLinkedList) RemoveByPosition(position int) interface{} {
	currentNode := s.Head
	count := 0
	var beforeNodeToDelete *SinglyNode
	var nodeToDelete *SinglyNode
	var deletedNode *SinglyNode

	if s.Length == 0 || position < 1 || position > s.Length {
		return "Non-Existent Node"
	}

	if position == 1 {
		s.Head = currentNode.Next
		deletedNode = currentNode
		currentNode = nil
		s.Length -= 1

		return deletedNode
	}

	for count < position && currentNode.Next != nil {
		beforeNodeToDelete = currentNode
		nodeToDelete = currentNode.Next
		currentNode = nodeToDelete
		count++
	}

	beforeNodeToDelete.Next = nodeToDelete.Next
	deletedNode = nodeToDelete
	s.Length -= 1

	return deletedNode
}

func (s *SinglyLinkedList) RemoveByKey(key interface{}) interface{} {
	currentNode := s.Head
	var beforeNodeToDelete *SinglyNode
	var nodeToDelete *SinglyNode
	var deletedNode *SinglyNode

	if s.Contains(key) == false {
		return "Non-Existent Node"
	}

	if key == s.Head.Value {
		s.Head = currentNode.Next
		deletedNode = currentNode
		currentNode = nil
		s.Length -= 1

		return deletedNode
	}

	for currentNode.Value != key && currentNode.Next != nil {
		beforeNodeToDelete = currentNode
		nodeToDelete = currentNode.Next
		currentNode = nodeToDelete
	}

	beforeNodeToDelete.Next = nodeToDelete.Next
	deletedNode = nodeToDelete
	s.Length -= 1

	return deletedNode
}

func main() {
	ll := InitSinglyLikedList("I am root")
	ll.AddToList(1)
	ll.AddToList(2)
	fmt.Println(ll.Head.Next.Next)
	fmt.Println(ll.Tail)
	fmt.Println(ll.SearchByPosition(3))
	fmt.Println(ll.Get(4))
	fmt.Println(ll.Contains(2))
	fmt.Println(ll.Contains(4))
	fmt.Println("2 SHOULD BE: ", ll.SearchByPosition(3))
	fmt.Println("CHECKING TO SEE: ", ll.Contains(2))
	fmt.Println(ll.RemoveByPosition(3))
	fmt.Println(ll.RemoveByPosition(2))
	ll.AddToList(1)
	ll.AddToList(2)
	fmt.Println(ll.RemoveByKey(33))
	fmt.Println(ll.RemoveByKey(33))
	fmt.Println(ll.Contains(33))
	fmt.Println(ll.Contains(1))
}
