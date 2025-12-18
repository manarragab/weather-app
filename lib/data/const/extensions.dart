import 'package:intl/intl.dart';

extension Dates on DateTime {
  get stringDate => DateFormat('yyyy-MM-dd').format(this);
  get stringTime => DateFormat('HH:mm a').format(this);
  get stringTime24 => DateFormat('HH:mm').format(this);
  get stringAllDate => DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
}

extension StringExtension on String {
  String get reversed {
    return split('').reversed.join('');
  }
}

extension StringExtensions on String {
  bool get isHtml {
    final htmlPattern = RegExp(r'<[^>]*>', caseSensitive: false);
    return htmlPattern.hasMatch(this);
  }
}
