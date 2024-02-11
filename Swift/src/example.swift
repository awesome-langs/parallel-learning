import Foundation

func hello() {
    print("Hello World!")
}

func myFunction(_ myList: [Int]) -> String {
    return myList.filter { $0 % 2 == 0 }
        .map { "\($0 * 3)" }
        .reduce("", { $1 + $0 + $1 })
}

hello()
print(myFunction([1, 2, 3, 4, 5]))