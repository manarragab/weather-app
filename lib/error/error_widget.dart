import 'package:weather_app/localization/all_keys.dart';
import 'package:weather_app/res/configuration/color.dart';
import 'package:weather_app/res/configuration/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TErrorWidget extends StatefulWidget {
  TErrorWidget({this.error, this.onTap, Key? key}) : super(key: key);
  String? error;
  void Function()? onTap;
  @override
  _TErrorWidgetState createState() {
    return _TErrorWidgetState();
  }
}

class _TErrorWidgetState extends State<TErrorWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: widget.onTap,
          child: SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Center(
                        child: Icon(
                  Icons.error_outline,
                  color: CustomColors.primary,
                  size: 200,
                ))),
                Text(
                  widget.error ?? CustomTrans.internalServerError.tr,
                  style: TFonts.style(
                      color: CustomColors.primary,
                      fontWeight: TFontWights.bold,
                      fontSize: TFontSizes.f26),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
