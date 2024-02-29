using Printf

function my_string_to_int(s)
    parse(Int, s)
end

function my_string_to_double(s)
    parse(Float64, s)
end

function my_int_to_string(i)
    string(i)
end

function my_double_to_string(d)
    @sprintf("%.6f", d)
end

function my_bool_to_string(b)
    b ? "true" : "false"
end

function my_int_to_nullable(i)
    if i > 0
        return i
    elseif i < 0
        return -i
    else
        return nothing
    end
end

function my_nullable_to_int(i)
    return coalesce(i, -1)
end

function my_list_sorted(lst)
    sort(lst)
end

function my_list_sorted_by_length(lst)
    sort(lst, by = x -> length(x))
end

function my_list_filter(lst)
    filter(x -> x % 3 == 0, lst)
end

function my_list_map(lst)
    map(x -> x * x, lst)
end

function my_list_reduce(lst)
    reduce((acc, x) -> acc * 10 + x, lst, init = 0)
end

function my_list_operations(lst)
    lst |> l -> filter(x -> x % 3 == 0, l) |> 
        l -> map(x -> x * x, l) |> 
        l -> reduce((acc, x) -> acc * 10 + x, l, init = 0)
end

function my_list_to_dict(lst)
    Dict(x => x * x for x in lst)
end

function my_dict_to_list(dict)
    dict |> collect |> sort |> l -> map(x -> x[1] + x[2], l)
end

function my_print_string(s)
    println(s)
end

function my_print_string_list(lst)
    for x in lst
        print(x, " ")
    end
    println()
end

function my_print_int_list(lst)
    my_print_string_list(map(my_int_to_string, lst))
end

function my_print_dict(dict)
    for (k, v) in dict
        print(my_int_to_string(k) * "->" * my_int_to_string(v) * " ")
    end
    println()
end

my_print_string("Hello, World!")
my_print_string(my_int_to_string(my_string_to_int("123")))
my_print_string(my_double_to_string(my_string_to_double("123.456")))
my_print_string(my_bool_to_string(false))
my_print_string(my_int_to_string(my_nullable_to_int(my_int_to_nullable(18))))
my_print_string(my_int_to_string(my_nullable_to_int(my_int_to_nullable(-15))))
my_print_string(my_int_to_string(my_nullable_to_int(my_int_to_nullable(0))))
my_print_string_list(my_list_sorted(["e", "dddd", "ccccc", "bb", "aaa"]))
my_print_string_list(my_list_sorted_by_length(["e", "dddd", "ccccc", "bb", "aaa"]))
my_print_string(my_int_to_string(my_list_reduce(my_list_map(my_list_filter([3, 12, 5, 8, 9, 15, 7, 17, 21, 11])))))
my_print_string(my_int_to_string(my_list_operations([3, 12, 5, 8, 9, 15, 7, 17, 21, 11])))
my_print_dict(my_list_to_dict([3, 1, 4, 2, 5, 9, 8, 6, 7, 0]))
my_print_int_list(my_dict_to_list(Dict(3 => 9, 1 => 1, 4 => 16, 2 => 4, 5 => 25, 9 => 81, 8 => 64, 6 => 36, 7 => 49, 0 => 0)))