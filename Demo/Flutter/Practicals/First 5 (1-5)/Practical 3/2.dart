//W.A.P. to create class Animal that has a method called animalSound()
// subclass of Animal is cat it has its own implementation of an animal sound
import 'dart:io';
void main()
{
  Cat cat = Cat();
  cat.animalSound();
  Animal animal = Animal();
  animal.animalSound();
}
class Animal
{
  void animalSound()
  {
    print("The animal makes a sound");
  }
}
class Cat extends Animal
{
  void animalSound()
  {
    print("The cat says: Meow!");
  }
}


