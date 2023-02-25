extension StringExtension on String {
  String toSearchQuery() => replaceAll(' ', '').toLowerCase();
}
