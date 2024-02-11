from functools import reduce

def hello():
    print("Hello World!")

def my_function(my_list: list[int]) -> str:
    # return functools.reduce(lambda x, y: y + x + y, [str(x * 3) for x in my_list if x % 2 == 0], "")
    # rewrite with lambda
    return reduce(lambda x, y: y + x + y, 
        map(lambda x: str(x * 3),
            filter(lambda x: x % 2 == 0, my_list)),
        "")

hello()
print(my_function([1, 2, 3, 4, 5]))