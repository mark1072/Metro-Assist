import '../lines.dart';

String getDirection(String start, String end) {
  return '$start ↔ $end';
}

final Map<MetroLine, List<String>> lineEnds = {
  MetroLine.line1: ['Helwan', 'New Marg'],
  MetroLine.line2: ['Shubra El Kheima', 'El Mounib'],
  MetroLine.line3: ['Adly Mansour', 'Ring Road'], // Ring Road branch
};

String getDirectionText({
  required MetroLine line,
  required List<String> route,
  required int startIndex,
}) {
  final ends = lineEnds[line]!;

  int distanceToEnd(String end) {
    final idx = route.indexOf(end);
    return idx == -1 ? 9999 : (idx - startIndex).abs();
  }

  final toward = distanceToEnd(ends[0]) < distanceToEnd(ends[1])
      ? ends[0]
      : ends[1];

  return 'toward $toward';
}

List<String> buildInstructions(List<String> route) {
  final instructions = <String>[];

  MetroLine? currentLine;

  for (int i = 0; i < route.length - 1; i++) {
    final from = route[i];
    final to = route[i + 1];

    final fromLines = stationLines[from] ?? {};
    final toLines = stationLines[to] ?? {};
    final common = fromLines.intersection(toLines);

    if (common.isEmpty) continue;

    final nextLine = common.first;

    if (currentLine == null) {
      currentLine = nextLine;
      instructions.add(
        'Take ${lineName(currentLine)} '
        '${getDirectionText(line: currentLine, route: route, startIndex: i)}',
      );
    } else if (currentLine != nextLine) {
      instructions.add(
        'Change from ${lineName(currentLine)} '
        'to ${lineName(nextLine)} at $from',
      );
      currentLine = nextLine;
      instructions.add(
        'Take ${lineName(currentLine)} '
        '${getDirectionText(line: currentLine, route: route, startIndex: i)}',
      );
    }
  }

  return instructions;
}
