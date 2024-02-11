def hello() {
    println "Hello World!"
}

def myFunction(List<Integer> myList) {
    return myList.findAll { it % 2 == 0 }
        .collect { (it * 3).toString() }
        .inject("", { result, value -> value + result + value })
}

hello()
println myFunction([1, 2, 3, 4, 5])