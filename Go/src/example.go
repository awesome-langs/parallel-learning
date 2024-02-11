package main

import (
	"fmt"
	"strconv"
)

func hello() {
    fmt.Println("Hello World!")
}

func MyFunction(myList []int) string {
	result := ""
	for _, x := range myList {
		if x%2 == 0 {
			str := strconv.Itoa(x * 3)
			result = str + result + str
		}
	}
	return result
}

func main() {
    hello()
    fmt.Println(MyFunction([]int{1, 2, 3, 4, 5}))
}
