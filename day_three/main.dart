import 'dart:io';

void main() async {
  File file = File('day_three/input.txt');
  List<String> lines = await file.readAsLines();

  // Creat RegExp to show the template we search for "mul(num,num)"
  final regex = RegExp(r'mul\(\d+,\d+\)');

  final matches = regex.allMatches(lines.toString());

  int sum = 0;

  //found the valid exp and delete mul & ( ) & , then sum the numbers
  for (var match in matches) {
    String validInstruction = match.group(0)!;
    var numbers = validInstruction
        .replaceAll('mul(', '')
        .replaceAll(')', '')
        .split(',')
        .map(int.parse)
        .toList();
    sum += numbers[0] * numbers[1];
  }

  print(sum);
}
