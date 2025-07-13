// WAP to insert double into list and display in terminal do sum of all numbers and print it with 2 decimal only EX:22.3888888 = 22.40

import "dart:io";
void main(){
    print("Enter 2 decimal numbers : ");
    List<double> numbers=[];
    for (int i=0;i<2;i++){
        var n = double.parse(stdin.readLineSync()!);        
        numbers.add(n);
    }
    var sum = numbers.reduce((a,b)=>a+b);
    print(sum.toStringAsFixed(2));
}