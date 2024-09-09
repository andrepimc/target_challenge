import 'dart:math';

void main() {
  int maxValue = 1000;
  List<double> dailyRevenue =
      List<double>.generate(365, (i) => (Random().nextDouble() * maxValue))
        ..shuffle();
  print(findHighest(dailyRevenue));
  print(findLowest(dailyRevenue));
  print(numberOfDaysAboveYearAverage(dailyRevenue));
}

String findHighest(List<double> input) {
  double element = input.reduce(max);
  return element.toStringAsFixed(3);
}

String findLowest(List<double> input) {
  double element = input.reduce(min);
  return element.toStringAsFixed(3);
}

String numberOfDaysAboveYearAverage(List<double> input) {
  List<double> dailyRevenueWithoutZeros =
      input.where((element) => element > 0.0).toList();
  double average = (dailyRevenueWithoutZeros.reduce((a, b) => a + b) / 365);
  List<double> aboveDays =
      input.where((element) => element >= average).toList();
  return "${aboveDays.length} days";
}
