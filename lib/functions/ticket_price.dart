int calculatePrice(int stationsCount) {
  if (stationsCount <= 9) return 8;
  if (stationsCount <= 16) return 10;
  if (stationsCount <= 23) return 15;
  return 20;
}
