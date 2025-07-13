import 'dart:io';
void main()
{
  print("enter any number:");
  int n=int.parse(stdin.readLineSync()!);
  if(n>0)
    {
      print("number is positive");
    }
  else
    {
      print("number is negative");
    }
}