defmodule Example do
    def hello do
        IO.puts "Hello World!"
    end
    
    def my_function(my_list) do
        my_list |> Enum.filter(fn x -> rem(x, 2) == 0 end)
            |> Enum.map(fn x -> Integer.to_string(x * 3) end)
            |> Enum.reduce("", fn y, x -> (y <> x <> y) end)
    end
end

Example.hello()
IO.puts Example.my_function([1, 2, 3, 4, 5])