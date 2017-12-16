package main

import (
	"fmt"
	"strconv"
)

type Queue struct {
	ItemsInfo  string
	Items      [][]string
	ItemsComma string
	SizeInfo   string
	Size       int
}

func InitQueue() *Queue {
	var items = make([][]string, 1)
	return &Queue{
		ItemsInfo:  "items:",
		Items:      items,
		ItemsComma: ",",
		SizeInfo:   "size:",
		Size:       0,
	}
}

func (q *Queue) Enqueue(item string) {
	if q.Size == 0 {
		key := strconv.Itoa(0)
		q.Items[0] = []string{key, item}
		q.Size += 1
	} else {
		var allItems [][]string
		var newAllItems [][]string
		allItems = make([][]string, 0)

		for i := 0; i < len(q.Items); i++ {
			if len(q.Items[i]) == 2 {
				allItems = append(allItems, q.Items[i])
			}
		}

		newItemIndex := strconv.Itoa(q.Size)
		newAllItems = make([][]string, 0)
		newAllItems = append(newAllItems, []string{newItemIndex, item})

		allItems = append(newAllItems, allItems...)

		q.Size += 1
		q.Items = allItems
	}
}

func first(args ...interface{}) interface{} {
	return args[0]
}

func (q *Queue) Dequeue() []string {
	var poppedItem []string
	var newItems [][]string
	poppedItem = q.Items[len(q.Items)-1]
	q.Items = q.Items[0 : len(q.Items)-1]
	newItems = make([][]string, 0)

	for i := 0; i < len(q.Items); i++ {
		newItems = append(newItems, []string{strconv.Itoa(len(q.Items) - (i + 1)), q.Items[i][1]})
	}

	q.Size -= 1
	q.Items = newItems

	fmt.Printf("%s\n", poppedItem)
	return poppedItem
}

func (q *Queue) Clear() {
	q.Size = 0
	q.Items = make([][]string, 1)
}

func (q *Queue) IsEmpty() bool {
	fmt.Println(q.Size == 0)
	return q.Size == 0
}

func (q *Queue) QueueSize() int {
	fmt.Println(q.Size)
	return q.Size
}

func main() {
	oo := InitQueue()
	oo.Enqueue("hello")
	oo.Enqueue("1234")
	oo.Enqueue("3344")
	oo.Enqueue("52345")
	oo.Dequeue()
	fmt.Println(oo.Items)
	oo.Enqueue("Alex")
	oo.Enqueue("John")
	oo.Enqueue("Computer Science")
	oo.Enqueue("RANDOM INPUT")
	fmt.Println(oo.Items)
}
