object Example {
    def hello(): Unit = {
        println("Hello World!")
    }
    def myFunction(myList: Seq[Int]): String = {
        myList.filter(_ % 2 == 0)
            .map(x => (x * 3).toString)
            .foldLeft("")((x, y) => y + x + y)
    }
    def main(args: Array[String]): Unit = {
        hello()
        println(myFunction(Seq(1, 2, 3, 4, 5)))
    }
}
