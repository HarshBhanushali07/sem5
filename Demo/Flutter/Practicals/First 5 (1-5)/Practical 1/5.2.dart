import 'dart:io';
void main()
{
  print("enter number 1:");
  int a=int.parse(stdin.readLineSync()!);
  print("enter number 2:");
  int b=int.parse(stdin.readLineSync()!);
  String op = stdin.readLineSync()!;
  dynamic ans;
  if(op=='+')
  {
    ans=a+b;
    print("your addition is: $ans");
  }
   if(op=='-')
  {
    ans=a-b;
    print("your sub is:$ans") ;
  }
   if(op=='*')
  {
    ans=a*b;
    print("your multiplication is:$ans") ;
  }
   if(op=='/')
  {
    ans=a/b;
    print("your division is:$ans") ;
  }
}