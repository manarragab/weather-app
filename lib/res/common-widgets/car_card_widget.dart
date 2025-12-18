import 'package:weather_app/data/const/extensions.dart';
import 'package:weather_app/res/configuration/fonts.dart';
import 'package:weather_app/res/configuration/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarCardWidget extends StatelessWidget {
  const CarCardWidget({
    super.key,
    this.cardText = "N T U",
  });

  final String cardText;

  @override
  Widget build(BuildContext context) {
    double fontSize = 6;
    return Container(
      width: 115,
      height: 33,
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        //  vertical: 3.h,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (cardText.isNotEmpty)
                SizedBox(
                  height: 15,
                  // decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                  child: Text(
                    replaceFarsiNumber(splitString(cardText).first),
                    style: TFonts.style(
                        fontSize: fontSize + 5,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
              if (cardText.isNotEmpty)
                Text(
                  splitString(cardText).first,
                  style: TFonts.style(
                      fontSize: fontSize + 5, fontWeight: FontWeight.normal),
                ),
            ],
          ),
          const SizedBox(
            width: 4,
          ),
          CustomImage.asset(
            'assets/svg/saudi.svg',
            width: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (splitString(cardText).isNotEmpty)
                SizedBox(
                  height: 15,
                  // decoration: BoxDecoration(border:Border.all(color: Colors.black)),
                  child: Text(
                    splitString(cardText)[1].reversed.replaceAll("", " "),
                    style: TFonts.style(
                        fontSize: fontSize + 5, fontWeight: FontWeight.bold),
                  ),
                ),
              if (cardText.isNotEmpty)
                Text(
                  splitString(cardText).last,
                  style: TFonts.style(
                      fontSize: fontSize + 5,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

  List<String> splitString(String input) {
    RegExp regex = RegExp(r'(\d+)|([A-Za-z]+)|([\u0600-\u06FF]+)');
    Iterable<Match> matches = regex.allMatches(input);

    List<String> parts = [];
    for (Match match in matches) {
      for (int i = 1; i <= 3; i++) {
        String? part = match.group(i);
        if (part != null) {
          parts.add(part);
          if (parts.length == 3 && i != 2) {
            // Swap the second and third elements to ensure Arabic is in the middle
            String temp = parts[1];
            parts[1] = parts[2];
            parts[2] = temp;
          }
          break;
        }
      }
    }

    return parts;
  }
}
