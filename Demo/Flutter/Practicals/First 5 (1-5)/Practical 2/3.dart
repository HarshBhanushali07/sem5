// WAP to insert String list and display in terminal

import "dart:io";
void main(){
    print("Enter 5 strings : ");
    List<String> strings=[];
    for (int i =0;i<5;i++){
        String str = stdin.readLineSync()!;
        strings.add(str);
    }
    print(strings);
}