function hello()
    println("Hello World!")
end

function my_function(my_list::Vector{Int})
    return my_list |> 
        a -> filter(x -> x % 2 == 0, a) |> 
        a -> map(x -> string(x * 3), a) |>
        a -> reduce((x, y) -> y * x * y, a, init = "")
end

hello()
println(my_function([1, 2, 3, 4, 5]))