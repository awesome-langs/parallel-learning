def hello
    puts "Hello World!"
end

def my_function(my_list)
    my_list.select { |x| x % 2 == 0 }
        .map { |x| (x * 3).to_s }
        .reduce("") { |x, y| y + x + y }
end

hello()
puts my_function([1, 2, 3, 4, 5])