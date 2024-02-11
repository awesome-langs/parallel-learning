void hello() {
    print("Hello World!");
}

String myFunction(List<int> myList) {
    return myList.where((x) => x % 2 == 0)
        .map((x) => (x * 3).toString())
        .fold("", (x, y) => y + x + y);
}


void main() {
    hello();
    print(myFunction([1, 2, 3, 4, 5]));
}
