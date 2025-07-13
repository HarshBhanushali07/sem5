5// WAP to cound number of even and odd number in array of n number;

import "dart:io";
void main(){
    print("Enter size of array : ");
    var n = int.parse(stdin.readLineSync()!);
    List arr = [];
    for (int i = 0;i<n ; i++){
        var number = int.parse(stdin.readLineSync()!);
        arr.add(number);
    }
    var odd=0;
    var even=0;
    for(int i = 0; i<n;i++){
        if(arr[i]%2==0){
            even++;
        }
        else{
            odd++;
        }
    }
    print("even : $even , odd : $odd");
}