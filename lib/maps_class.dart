import 'dart:io';

void main() {
  List<int> list = [1, 2, 4, 5];

  Map<int, int> myMap = {
    0: 1,
    4: 2,
    5: 10,
  };

  Map<String, int> myMap2 = {'a': 9023, 'b': 298, 'c': 298};

  list.add(28);
  list[2] = 10;
  myMap[1] = 20;
  myMap2['d'] = 120;

  // print(list);
  // print(myMap2);

  // list.forEach((element) {
  //   print(element);
  // });
  //
  // myMap2.forEach((key, value) {
  //   print("Value of $key is $value");
  // });
  //
  //

  Map<String, int> studentsMarks = {};

  int num = int.tryParse(stdin.readLineSync()!) ?? 0;
  for (int i = 0; i < num; i++) {
    print("For student ${i + 1}");

    stdout.write("Enter name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter marks: ");
    int marks = int.tryParse(stdin.readLineSync()!) ?? 0;
    studentsMarks[name] = marks;
  }
  print(studentsMarks);
}
