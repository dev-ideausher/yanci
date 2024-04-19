String formatCurrency(double value) {
  const List<String> suffixes = [
    "", //for case when value is less than 1000, no formatting required
    'K',
    'M',
    'B'
  ];
  int suffixIndex = 0;
  while (value >= 1000 && suffixIndex < suffixes.length - 1) {
    value /= 1000;
    suffixIndex++;
  }
  return '${value.toStringAsFixed(1)}${suffixes[suffixIndex]}';
}
