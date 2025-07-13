// WAP to insert int numbers into list and display in terminal

import "dart:io";
void main(){
    print("Enter 5 numbers : ");
    List arr=[];
    for (int i = 0;i<5;i++){
        var number = int.parse(stdin.readLineSync()!);
        arr.add(number);
    }
    print(arr);
}