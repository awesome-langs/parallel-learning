const hello = (): void => {
    console.log("Hello World!");
};

const myFunction = (myList: number[]): string => {
    return myList.filter(x => x % 2 === 0)
        .map(x => (x * 3).toString())
        .reduce((x, y) => y + x + y, '');
};
  
hello();
console.log(myFunction([1, 2, 3, 4, 5]));  