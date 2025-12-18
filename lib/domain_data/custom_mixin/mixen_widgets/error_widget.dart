import 'package:flutter/material.dart';

import '../../../res/configuration/fonts.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.msg, {this.onTap,super.key});
  final String? msg;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Text(
          msg ?? "error please contact developer",
          style: TFonts.textTitleStyle(),
        ),
      ),
    );
  }
}
