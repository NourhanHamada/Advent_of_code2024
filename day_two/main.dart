import 'dart:io';

void main() async {
  File file = File('day_two/input.txt');
  List<String> lines = await file.readAsLines();

  // Split each line of input into a list of int
  // This will create a list of lists, where each inner list represents the numbers in a line
  List<List<int>> newLines = lines.map((line) {
    return line.split(' ').map(int.parse).toList();
  }).toList();

  int safeCount = 0;

  for (var line in newLines) {
    bool isSafe = true;

    // Check for differences and if they follow the rules
    for (int i = 0; i < line.length - 1; i++) {
      int difference = line[i + 1] - line[i];

      // Check the difference between numbers is min 1 & max 3.
      if (difference.abs() < 1 || difference.abs() > 3) {
        isSafe = false;
        break;
      }

      // Check if all numbers are increasing or decreasing
      if (i > 0 && (difference > 0) != (line[i] - line[i - 1] > 0)) {
        isSafe = false;
        break;
      }
    }

    if (isSafe) {
      safeCount++;
    }
  }

  print(safeCount);
}
