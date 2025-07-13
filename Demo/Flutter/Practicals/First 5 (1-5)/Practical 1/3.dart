import 'dart:io';
void main()
{
  print("enter weight here in pounds: ");
  double weight = double.parse(stdin.readLineSync()!)*0.45359237;
  print("enter height here in inches:");
  double height= double.parse(stdin.readLineSync()!)*0.0254;
  double BMI= weight/(height*height);
  print("your BMI is : $BMI");
}