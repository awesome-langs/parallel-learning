#include <iostream>
#include <string>
#include <vector>
#include <ranges>
#include <algorithm>

using namespace std;

void hello() {
    cout << "Hello World!" << endl;
}

string myFunction(const vector<int>& my_list) {
    return ranges::fold_left(my_list 
        | views::filter([](int x) { return x % 2 == 0; }) 
        | views::transform([](int x) { return to_string(x * 3); })
        , string(""), [](string x, string y) { return y + x + y; });
}

int main() {
    hello();
    cout << myFunction(vector<int>{1, 2, 3, 4, 5}) << endl;
    return 0;
}
