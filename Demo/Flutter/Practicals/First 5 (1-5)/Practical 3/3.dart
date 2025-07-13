// W.A.P. to find friends detail by their name using dictionary.
//(Create local dictionary and search from it using Map & Model Class)

import 'dart:io';

class friend
{
  String? city;
  int? age;
  friend(this.city,this.age);
}

void main()
{
  Map<String,friend> frl =
  {
    "Tirth":friend("Kutch",18),
    "Tanmay":friend("Dhrol",17),
    "Anuj":friend("Rajkot",18),
    "Dev":friend("Bhuj",17)
  };
  print("Enter Name of friend:");
  String find =stdin.readLineSync()!;

  List names = frl.keys.toList();
  if(names.contains(find))
  {
    print("Found it.....");
  }
  else
  {
    print("Not Found....");
  }
}