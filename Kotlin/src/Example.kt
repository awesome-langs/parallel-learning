fun hello() {
    println("Hello World!")
}

fun myFunction(myList: List<Int>): String {
    return myList.filter { it % 2 == 0 }
        .map { (it * 3).toString() }
        .fold("", { x, y -> y + x + y })
}

fun main() {
    hello()
    println(myFunction(listOf(1, 2, 3, 4, 5)))
}