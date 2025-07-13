import 'dart:io';
void main()
{
  print("enter number 1:");
  int a=int.parse(stdin.readLineSync()!);
  print("enter number 2:");
  int b=int.parse(stdin.readLineSync()!);
  String op = stdin.readLineSync()!;
  switch(op)
  {
    case '+':
      dynamic ans=a+b;
      print("your addition is $ans");
      break;
    case '-':
      dynamic ans=a-b;
      print("your substraction is $ans");
      break;
    case '*':
      dynamic ans=a*b;
      print("your multiplicaation is $ans");
      break;
    case '/':
      dynamic ans=a/b;
      print("your division is $ans");
      break;
    default:
      print("enter valid operator");
  }
}