#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <unordered_map>
#include <ranges>
#include <format>

using namespace std;

int myStringToInt(string s) {
    return stoi(s);
}

double myStringToDouble(string s) {
    return stod(s);
}

string myIntToString(int i) {
    return to_string(i);
}

string myDoubleToString(double d) {
    return format("{:.6f}", d);
}

string myBoolToString(bool b) {
    return b ? "true" : "false";
}

optional<int> myIntToNullable(int i) {
    if (i > 0) {
        return i;
    } else if (i < 0) {
        return -i;
    } else {
        return nullopt;
    }
}

int myNullableToInt(optional<int> i) {
    return i.value_or(-1);
}

vector<string> myListSorted(const vector<string>& lst) {
    auto tmp = lst;
    ranges::sort(tmp);
    return tmp;
}

vector<string> myListSortedByLength(const vector<string>& lst) {
    auto tmp = lst;
    ranges::sort(tmp, [](auto& a, auto& b) { return a.size() < b.size(); });
    return tmp;
}

vector<int> myListFilter(const vector<int>& lst) {
    auto tmp = lst | views::filter([](auto x) { return x % 3 == 0; });
    return vector<int>(tmp.begin(), tmp.end());
}

vector<int> myListMap(const vector<int>& lst) {
    auto tmp = lst | views::transform([](auto x) { return x * x; });
    return vector<int>(tmp.begin(), tmp.end());
}

int myListReduce(const vector<int>& lst) {
    return ranges::fold_left(lst, 0, 
        [](auto acc, auto x) { return acc * 10 + x; });
}

int myListOperations(const vector<int>& lst) {
    return ranges::fold_left( lst 
        | views::filter([](auto x) { return x % 3 == 0; })
        | views::transform([](auto x) { return x * x; }), 
        0, [](auto acc, auto x) { return acc * 10 + x; });
}

unordered_map<int, int> myListToDict(const vector<int>& lst) {
    auto tmp = lst | views::transform([](auto x) { return pair(x, x * x); });
    return unordered_map<int, int>(tmp.begin(), tmp.end());
}

vector<int> myDictToList(const unordered_map<int, int>& dict) {
    auto tmp0 = dict | views::transform([](auto x) { return x.first + x.second; });
    auto tmp = vector<int>(tmp0.begin(), tmp0.end());
    ranges::sort(tmp);
    return tmp;
}

void myPrintString(string s) {
    cout << s << endl;
}

void myPrintStringList(const vector<string>& lst) {
    for (auto& x : lst) {
        cout << x + " ";
    }
    cout << endl;
}

void myPrintIntList(const vector<int>& lst) {
    auto tmp = lst | views::transform(myIntToString);
    myPrintStringList(vector<string>(tmp.begin(), tmp.end()));
}

void myPrintDict(const unordered_map<int, int>& dict) {
    for (auto& [k, v] : dict) {
        cout << myIntToString(k) + "->" + myIntToString(v) + " ";
    }
    cout << endl; 
}

int main() {
    myPrintString("Hello, World!");
    myPrintString(myIntToString(myStringToInt("123")));
    myPrintString(myDoubleToString(myStringToDouble("123.456")));
    myPrintString(myBoolToString(false));
    myPrintString(myIntToString(myNullableToInt(myIntToNullable(18))));
    myPrintString(myIntToString(myNullableToInt(myIntToNullable(-15))));
    myPrintString(myIntToString(myNullableToInt(myIntToNullable(0))));
    myPrintStringList(myListSorted({"e", "dddd", "ccccc", "bb", "aaa"}));
    myPrintStringList(myListSortedByLength({"e", "dddd", "ccccc", "bb", "aaa"}));
    myPrintString(myIntToString(myListReduce(myListMap(myListFilter({3, 12, 5, 8, 9, 15, 7, 17, 21, 11})))));
    myPrintString(myIntToString(myListOperations({3, 12, 5, 8, 9, 15, 7, 17, 21, 11})));
    myPrintDict(myListToDict({3, 1, 4, 2, 5, 9, 8, 6, 7, 0}));
    myPrintIntList(myDictToList({{3, 9}, {1, 1}, {4, 16}, {2, 4}, {5, 25}, {9, 81}, {8, 64}, {6, 36}, {7, 49}, {0, 0}}));
}

