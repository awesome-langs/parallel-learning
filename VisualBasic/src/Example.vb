Module Example
    Sub hello()
        Console.WriteLine("Hello World!")
    End Sub

    Function MyFunction(myList As IList(Of Integer)) As String
        Return myList.Where(Function(x) x Mod 2 = 0) _
                    .Select(Function(x) (x * 3).ToString()) _
                    .Aggregate("", Function(x, y) y & x & y)
    End Function

    Sub Main()
        hello()
        Console.WriteLine(MyFunction(New List(Of Integer) From {1, 2, 3, 4, 5}))
    End Sub
End Module
