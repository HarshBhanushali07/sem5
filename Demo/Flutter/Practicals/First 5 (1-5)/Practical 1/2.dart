import "dart:io";
void main()
{
  print("enter marks of 5 subject");
  List marks = [];
  for (int i=1;i<=5;i++)
    {
      print("enter the marks for :- $i");
      marks.add(double.parse(stdin.readLineSync()!));
    }
  double total=marks.reduce((a,b)=>a+b);
  double percentage=(total)/5;
  print("your percentage is:$percentage");
}