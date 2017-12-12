package main

import (
	"fmt"
	"strconv"
)

type Queue struct {
	ItemsInfo  string
	Items      map[string]string
	ItemsComma string
	SizeInfo   string
	Size       int64
}

func InitQueue() *Queue {
	var items = make(map[string]string)
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
		q.Items[key] = item
		q.Size += 1
	} else {
		var allItems []string
		var count int = 0
		allItems = make([]string, q.Size+1)

		for _, v := range q.Items {
			if len(v) > 0 {
				allItems = append(allItems, v)
			}
		}

		allItems = allItems[2:len(allItems)]

		allItems = append([]string{item}, allItems...)

		q.Size += 1

		for i, _ := range q.Items {
			delete(q.Items, i)
		}

		for i, v := range allItems {
			k := strconv.Itoa((i - count))
			if len(v) > 0 {
				q.Items[k] = v
			} else {
				count += 1
			}
		}
	}
}

/*

first_in_queue = ''
all_items = @items.values
first_in_queue = all_items.last
ze_items = all_items[0..all_items.length - 1]

ze_items.each_with_index do |el , i|
  @items[i] = el
end

@items.delete(@size - 1)
@size = @size - 1
first_in_queue


*/

func (q *Queue) Dequeue() string {
	var allItems []string
	var remainingItems []string
	var poppedItem string
	var count int = 0

	allItems = make([]string, q.Size-1)

	for _, v := range q.Items {
		allItems = append(allItems, v)
	}

	allItems = allItems[1 : len(allItems)-1]
	poppedItem = q.Items["0"]
	remainingItems = allItems[1:len(allItems)]

	for k, _ := range q.Items {
		delete(q.Items, k)
	}

	q.Size -= 1

	for i, v := range remainingItems {
		k := strconv.Itoa((i - count))
		if len(v) > 0 {
			q.Items[k] = v
		} else {
			count += 1
		}
	}

	fmt.Println(poppedItem)
	return poppedItem
}

func (q *Queue) Clear() {
	q.Size = 0
	for k, _ := range q.Items {
		delete(q.Items, k)
	}
}

func (q *Queue) IsEmpty() bool {
	fmt.Println(q.Size == 0)
	return q.Size == 0
}

func (q *Queue) QueueSize() int64 {
	fmt.Println(q.Size)
	return q.Size
}

func (q *Queue) ToArray() [][]string {
	var keyValArr [][]string
	for k, v := range q.Items {
		keyValArr = append(keyValArr, []string{k, v})
	}
	fmt.Println(keyValArr)
	return keyValArr
}

func main() {
	oo := InitQueue()
	oo.Enqueue("hello")
	oo.Enqueue("1234")
	oo.Enqueue("3344")
	oo.Dequeue()
	fmt.Println("OO IS NOW: ", oo)
	oo.Enqueue("8888")
	fmt.Println("OO IS NOW: ", oo)
	oo.Enqueue("AYYOOO")
	oo.Enqueue("NOOOOOO")
	fmt.Println("OO IS NOW: ", oo)
}

//SOMETHING IS STILL NOT WORKING PERFECTLY
