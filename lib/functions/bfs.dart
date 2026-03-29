 // ignore_for_file: file_names

 List<List<String>> findShortestRoutes(
  Map<String, List<String>> graph,
  String start,
  String end,
) {
  final queue = <List<String>>[
    [start],
  ];
  final visited = <String, int>{start: 0};
  final routes = <List<String>>[];
  int shortestLength = -1;

  while (queue.isNotEmpty) {
    final path = queue.removeAt(0);
    final station = path.last;

    if (shortestLength != -1 && path.length > shortestLength) break;

    if (station == end) {
      shortestLength = path.length;
      routes.add(path);
      continue;
    }

    for (final next in graph[station] ?? []) {
      if (!visited.containsKey(next) || visited[next]! >= path.length) {
        visited[next] = path.length;
        queue.add([...path, next]);
      }
    }
  }

  return routes;
}
