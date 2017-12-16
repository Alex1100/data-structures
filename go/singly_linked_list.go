package main

import (
	"fmt"
)

type SinglyNode struct {
	ValueInfo  string
	Value      string
	ValueComma string
	NextInfo   string
	Next       string
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

func InitNode(v string) *SinglyNode {
	return &SinglyNode{
		ValueInfo:  "Value:",
		Value:      v,
		ValueComma: ",",
		NextInfo:   "Next:",
		Next:       "nil",
	}
}

func (n *SinglyNode) InitSinglyLikedList() *SinglyLinkedList {
	return &SinglyLinkedList{
		HeadInfo:  "Head:",
		Head:      n,
		HeadComma: ",",
		TailInfo:  "Tail:",
		Tail:      n,
		TailComma: ",",
		Length:    1,
	}
}

func main() {
	rootNode := InitNode("I am root")
	ll := rootNode.InitSinglyLikedList()
	fmt.Println(ll.Head)
}
