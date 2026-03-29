import '../lines.dart';

const int timePerStation = 2; // minutes
const int lineChangeTime = 5; // minutes
int calculateTravelTime(List<String> route) {
  if (route.isEmpty) return 0;

  int totalTime = 0;

  MetroLine? currentLine;

  for (int i = 0; i < route.length - 1; i++) {
    final from = route[i];
    final to = route[i + 1];

    totalTime += timePerStation;

    final fromLines = stationLines[from] ?? {};
    final toLines = stationLines[to] ?? {};
    final common = fromLines.intersection(toLines);

    if (common.isEmpty) continue;

    final nextLine = common.first;

    if (currentLine != null && currentLine != nextLine) {
      totalTime += lineChangeTime;
    }

    currentLine = nextLine;
  }

  return totalTime;
}
