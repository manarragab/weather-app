import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CustomFormatter {
  static TextInputFormatter onlyDouble() {
    return DoubleTextInputFormatter();
  }

  static TextInputFormatter onlyPhoneNumber() {
    return PhoneNumberFormatter();
  }

  static TextInputFormatter onlyArabic() {
    return ArabicInputFormatter();
  }

  static TextInputFormatter onlyEnglish() {
    return EnglishInputFormatter();
  }

  static TextInputFormatter capitalAfterSpacing() {
    return CapitalizeAfterSpaceFormatter();
  }
}

class DoubleTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    } else if (newValue.text.split("").last == ".") {
      if (newValue.text.split("").where((char) => char == ".").length > 1) {
        // String contains more than one occurrence of "."
        final modifiedText =
            newValue.text.substring(0, newValue.text.length - 1);
        return TextEditingValue(
          text: modifiedText,
          selection: TextSelection.collapsed(offset: modifiedText.length),
        );
      }
      return newValue;
    } else if (newValue.text.split("").last != "." &&
        newValue.text.split("").last != "," &&
        num.tryParse(newValue.text.split("").last) == null) {
      print(
          'getting into there ${newValue.text}  ${num.tryParse(newValue.text.split("").last)}');
      final modifiedText = newValue.text.substring(0, newValue.text.length - 1);
      return TextEditingValue(
        text: modifiedText,
        selection: TextSelection.collapsed(offset: modifiedText.length),
      );
    }

    return newValue;
  }
}

class PriceTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    } else if (newValue.text.split("").last == ".") {
      if (newValue.text.split("").where((char) => char == ".").length > 1) {
        // String contains more than one occurrence of "."
        final modifiedText =
            newValue.text.substring(0, newValue.text.length - 1);
        return TextEditingValue(
          text: modifiedText,
          selection: TextSelection.collapsed(offset: modifiedText.length),
        );
      }
      return newValue;
    } else if (newValue.text.split("").last != "." &&
        newValue.text.split("").last != "," &&
        num.tryParse(newValue.text.split("").last) == null) {
      print(
          'getting into there ${newValue.text}  ${num.tryParse(newValue.text.split("").last)}');
      final modifiedText = newValue.text.substring(0, newValue.text.length - 1);
      return TextEditingValue(
        text: modifiedText,
        selection: TextSelection.collapsed(offset: modifiedText.length),
      );
    }
    // Remove commas and convert to double

    final double value = double.parse(newValue.text.replaceAll(",", ""));

    // Format the double value
    final formattedValue = NumberFormat('#,###.##').format(value);

    return newValue.copyWith(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: formattedValue.length),
    );
  }
}

class CapitalizeAfterSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Capitalize after space
    return TextEditingValue(
      text: newValue.text.split(' ').map((word) => word.capitalize()).join(' '),
      selection: newValue.selection.copyWith(
        baseOffset: newValue.selection.baseOffset,
        extentOffset: newValue.selection.extentOffset,
      ),
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final RegExp phoneNumberRegex = RegExp(r'^0[0-9]{0,9}$');

    if (phoneNumberRegex.hasMatch(newValue.text)) {
      return newValue;
    } else {
      // Return the old value if the new value doesn't match the pattern
      return oldValue;
    }
  }
}

class ArabicInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Use a regular expression to allow only Arabic characters
    final RegExp regex = RegExp(r'^[؀-ۿ\s]*$');
    if (!regex.hasMatch(newValue.text)) {
      // Reject the change if the new value doesn't match the regex
      return oldValue;
    }
    return newValue;
  }
}

class EnglishInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Use a regular expression to allow only English characters
    final RegExp regex = RegExp(r'^[a-zA-Z\s]*$');
    if (!regex.hasMatch(newValue.text)) {
      // Reject the change if the new value doesn't match the regex
      return oldValue;
    }
    return newValue;
  }
}
