package main

import (
	"fmt"
	"strconv"
)

type Stack struct {
	ItemsInfo  string
	Items      map[string]string
	ItemsComma string
	SizeInfo   string
	Size       int64
}

func InitStack() *Stack {
	var items = make(map[string]string)
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
		s.Items[key] = item
		s.Size += 1
	} else {
		var allItems []string
		allItems = make([]string, s.Size)

		for _, v := range s.Items {
			allItems = append(allItems, v)
		}

		allItems = allItems[1:len(allItems)]
		allItems = append([]string{item}, allItems...)
		s.Size += 1
		for i, v := range allItems {
			k := strconv.Itoa(i)
			s.Items[k] = v
		}
	}
}

func (s *Stack) Peek() string {
	fmt.Println(s.Items["0"])
	return s.Items["0"]
}

func (s *Stack) Pop() string {
	var allItems []string
	var poppedItem string

	allItems = make([]string, s.Size)

	for _, v := range s.Items {
		allItems = append(allItems, v)
	}

	allItems = allItems[2:len(allItems)]
	poppedItem = allItems[0]

	for k, _ := range s.Items {
		delete(s.Items, k)
	}

	s.Size -= 1

	for i, v := range allItems {
		k := strconv.Itoa(i)
		s.Items[k] = v
	}

	fmt.Println(poppedItem)
	return poppedItem
}

func (s *Stack) Clear() {
	s.Size = 0
	for k, _ := range s.Items {
		delete(s.Items, k)
	}
}

func (s *Stack) IsEmpty() bool {
	fmt.Println(s.Size == 0)
	return s.Size == 0
}

func (s *Stack) StackSize() int64 {
	fmt.Println(s.Size)
	return s.Size
}

func (s *Stack) ToArray() [][]string {
	var keyValArr [][]string
	for k, v := range s.Items {
		keyValArr = append(keyValArr, []string{k, v})
	}
	fmt.Println(keyValArr)
	return keyValArr
}

func main() {
	oo := InitStack()
	oo.Push("hello")
	oo.Peek()
	oo.Push("yoo")
	oo.Peek()
	oo.ToArray()
	oo.IsEmpty()
	oo.Clear()
	oo.IsEmpty()
	oo.Push("Hello")
	oo.Push("Yoo")
	oo.Pop()
	oo.Pop()
	oo.IsEmpty()
}
