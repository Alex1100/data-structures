package main

import (
	"fmt"
	"strconv"
)

type Stack struct {
	ItemsInfo  string
	Items      [][]string
	ItemsComma string
	SizeInfo   string
	Size       int
}

func InitStack() *Stack {
	var items = make([][]string, 1)
	return &Stack{
		ItemsInfo:  "items:",
		Items:      items,
		ItemsComma: ",",
		SizeInfo:   "size:",
		Size:       0,
	}
}

func (s *Stack) Push(item string) {
	if s.Size == 0 {
		key := strconv.Itoa(0)
		s.Items[0] = []string{key, item}
		s.Size += 1
	} else {

		var allItems [][]string
		var newAllItems [][]string
		allItems = make([][]string, 0)

		for i := 0; i < len(s.Items); i++ {
			allItems = append(allItems, []string{strconv.Itoa((i + 1)), s.Items[i][1]})
		}

		newItemIndex := strconv.Itoa(0)
		newAllItems = make([][]string, 0)
		newAllItems = append(newAllItems, []string{newItemIndex, item})

		allItems = append(newAllItems, allItems...)

		s.Size += 1
		s.Items = allItems
	}
}

func (s *Stack) Peek() []string {
	fmt.Println(s.Items[0])
	return s.Items[0]
}

func (s *Stack) Pop() ([]string, error) {
	if s.Size <= 0 {
		return nil, nil
	}

	var poppedItem []string = s.Items[0]
	var allItems [][]string

	allItems = make([][]string, 0)

	for i := 1; i < len(s.Items); i++ {
		allItems = append(allItems, []string{strconv.Itoa((i - 1)), s.Items[i][1]})
	}

	s.Items = allItems
	s.Size -= 1

	fmt.Println(poppedItem)
	return poppedItem, nil
}

func (s *Stack) Clear() {
	s.Size = 0
	s.Items = make([][]string, 1)
}

func (s *Stack) IsEmpty() bool {
	fmt.Println(s.Size == 0)
	return s.Size == 0
}

func (s *Stack) StackSize() int {
	fmt.Println(s.Size)
	return s.Size
}

func main() {
	oo := InitStack()
	oo.Push("hello")
	oo.Peek()
	oo.Push("yoo")
	oo.Push("COOL")
	fmt.Println(oo.Items)
	oo.Peek()
	oo.IsEmpty()
	oo.Clear()
	oo.IsEmpty()
	oo.Push("--3i-ii")
	oo.Push("nlnon")
	oo.Push("HELLO")
	oo.Push("TERE")
	fmt.Println(oo.Items)
	oo.Pop()
	fmt.Println(oo.Items)
	oo.Pop()
	oo.Pop()
	oo.Pop()
	oo.IsEmpty()
}
