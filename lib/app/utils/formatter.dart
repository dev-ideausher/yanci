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

String getTimeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 365) {
    final years = (difference.inDays / 365).floor();
    return '${years == 1 ? 'a year' : '$years years'} ago';
  } else if (difference.inDays > 30) {
    final months = (difference.inDays / 30).floor();
    return '${months == 1 ? 'a month' : '$months months'} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays == 1 ? 'a day' : '${difference.inDays} days'} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours == 1 ? 'an hour' : '${difference.inHours} hours'} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes == 1 ? 'a minute' : '${difference.inMinutes} minutes'} ago';
  } else {
    return 'just now';
  }
}
