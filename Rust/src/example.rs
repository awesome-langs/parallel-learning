fn hello() {
    println!("Hello World!");
}

fn my_function(my_list: &Vec<i32>) -> String {
    my_list.iter()
        .filter(|&x| x % 2 == 0)
        .map(|x| (x * 3).to_string())
        .fold(String::new(), |x, y| format!("{}{}{}", y, x, y))
}

fn main() {
    hello();
    println!("{}", my_function(&vec![1, 2, 3, 4, 5]));
}
