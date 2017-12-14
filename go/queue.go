package main

import (
	"encoding/hex"
	"fmt"
	"log"
	"strconv"
)

type Queue struct {
	ItemsInfo  string
	Items      map[string][]byte
	ItemsComma string
	SizeInfo   string
	Size       int64
}

func ToHex(s string) []byte {
	a := []byte(s)
	dst := make([]byte, hex.EncodedLen(len(a)))
	hex.Encode(dst, a)

	//To hex
	return dst
}

func FromHexToString(b []byte) string {
	dst := make([]byte, hex.DecodedLen(len(b)))
	z, err := hex.Decode(dst, b)
	if err != nil {
		log.Fatal(err)
	}

	//To string
	return string(dst[:z])
}

func InitQueue() *Queue {
	var items = make(map[string][]byte)
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
		q.Items[key] = ToHex(item)
		q.Size += 1
	} else {
		var allItems [][]byte
		allItems = make([][]byte, (q.Size))

		for _, v := range q.Items {
			allItems = append(allItems, v)
			allItems = allItems[1:len(allItems)]
		}

		allItems = append([][]byte{ToHex(item)}, allItems...)

		q.Size += 1

		for i, _ := range q.Items {
			delete(q.Items, i)
		}

		for i, v := range allItems {
			// fmt.Println("CHEKING CHECKING: ", i, v)
			k := strconv.Itoa(i)
			q.Items[k] = v
		}
	}
}

func (q *Queue) Dequeue() string {
	var allItems [][]byte
	// 	var remainingItems [][]byte
	var poppedItem string
	var count int = 0

	allItems = make([][]byte, 1)

	for i, v := range q.Items {
		// fmt.Println("CHECKER CHECKER: ", i, v)
		if i != "0" {
			allItems = append(allItems, v)
		}
	}

	allItems = allItems[1:len(allItems)]

	fmt.Println("ALL ITEMS ARE: ", allItems)
	poppedItem = FromHexToString(q.Items["0"])
	// 	remainingItems = allItems[1:len(allItems)]

	for k, _ := range q.Items {
		delete(q.Items, k)
	}

	q.Size -= 1

	for i, v := range allItems {
		fmt.Println("CHECK CHECK: ", v)
		k := strconv.Itoa((i - count))
		if len(v) > 0 {
			q.Items[k] = v
		} else {
			count += 1
		}
	}

	fmt.Printf("%s\n", poppedItem)
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
		fmt.Println(k, FromHexToString(v))
		keyValArr = append(keyValArr, []string{k, FromHexToString(v)})
	}
	fmt.Println(keyValArr)
	return keyValArr
}

func main() {
	oo := InitQueue()
	oo.Enqueue("hello")
	oo.ToArray()
	oo.Enqueue("1234")
	oo.ToArray()
	oo.Enqueue("3344")
	oo.ToArray()
	oo.Enqueue("52345")
	oo.ToArray()

}

//GOLANG MAPS DON'T KEEP INSERTION ORDER WHEN ITERATING OVER A MAP WITH MORE THAN 4 ENTRIES... SO I NEED TO USE SLICES INSTEAD OF MAPS FOR THE NEXT IMPLEMENTATION
//I TRIED TO HEX STRING INPUTS TO AVOID AUTO SORTING
//GOLANG INTERNALS....
