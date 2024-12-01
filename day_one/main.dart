import 'dart:io';

void main() async {
  File file = File('day_one/input.txt');
  List<String> lines = await file.readAsLines();

  List<int> leftList = [];
  List<int> rightList = [];

  for (var line in lines) {
    // This RegExp calculate see the white space between numbers whatever how much it's count
    var numbers = line.split(RegExp(r'\s+')).map((e) => int.parse(e)).toList();

    leftList.add(numbers[0]);
    rightList.add(numbers[1]);
  }

  leftList.sort();
  rightList.sort();

  int totalDistance = 0;
  for (int i = 0; i < leftList.length; i++) {
    totalDistance += (leftList[i] - rightList[i]).abs();
  }

  print(totalDistance);

  // Part Two

  var totalScore = 0;
  for (int i = 0; i < leftList.length; i++) {
    var repeatCount = rightList.where((item) => item == leftList[i]).length;
    var currentItemScore = repeatCount * leftList[i];

    totalScore += currentItemScore;
  }

  print(totalScore);
}
