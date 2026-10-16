import 'dart:io';

void main() {

  // print('Welcome Deepak in flutter tutorial');
  //
  // stdout.write('Enter your Full Name Deepak');
  //
  // var name = stdin.readLineSync();
  //
  // print("Welcome, $name");
  //
  // //objects create
  // // new Information(); //according to old dart
  // Information(); // we can use without 'new' according to new dart
  //
  // // int? a; if valua is nullable then use '?'

  int a;

  //Assign
  a = 10;

  print('the value of a is $a');

  BigInt longValue;
  longValue = BigInt.parse('922337203685477580799');

  print('the value of longValue is $longValue');

}

class Information {

  Information(); // default constructor


}