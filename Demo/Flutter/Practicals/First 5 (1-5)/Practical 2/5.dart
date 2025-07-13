// WAP to sort values in list 

import "dart:io";
void main(){
    print("Enter 5 numbers : ");
    List arr=[];
    for (int i = 0;i<5;i++){
        var number = int.parse(stdin.readLineSync()!);
        arr.add(number);
    }
    arr.sort();
    print(arr);
}