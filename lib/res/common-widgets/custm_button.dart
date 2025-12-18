import '../../data/const/export.dart';

class MainButton extends StatelessWidget {
  final String title;
  final TextStyle? buttonWordStyle;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double radius;
  final Widget? icon;
  final Widget? titleWidget;
  final double padding;
  final Widget? widget;
  final bool withShadow;
  final double? borderWidth;

  const MainButton({super.key, 
    
    this.title = "",
    this.width,
    this.height,
    required this.onPressed,
    this.buttonWordStyle,
    this.backgroundColor,
    this.borderColor,
    this.textColor = CustomColors.white,
    this.fontSize,
    this.radius = CustomPadding.radius,
    this.icon,
    this.titleWidget,
    this.padding = 0.0,
    this.widget,
    this.withShadow = true,
    this.borderWidth,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48,
      width: width ?? 343,
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: withShadow ? null : Colors.transparent,
          backgroundColor: backgroundColor ?? CustomColors.buttonColor,
          splashFactory: const NoSplashFactory(),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
              side: BorderSide(
                  color: borderColor ??
                      backgroundColor ??
                      CustomColors.buttonColor,
                  width:borderWidth?? 1.w,
                  style: BorderStyle.solid
                  //  strokeAlign: StrokeAlign.outside,
                  )),
          elevation: withShadow ? 2.0 : 0.0,
        ),
        child: widget ??
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                if (icon != null)
                  const SizedBox(
                    width: 2,
                  ),
                titleWidget ??
                    Text(
                      title,
                      style: buttonWordStyle ??
                          TFonts.style(
                            fontSize: fontSize ?? TFontSizes.f16,
                            fontWeight: TFontWights.bold,
                            color: textColor,
                          ),
                    ),
              ],
            ),
      ),
    );
  }
}

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    required MaterialInkController controller,
    required RenderBox referenceBox,
    required Offset position,
    required Color color,
    TextDirection? textDirection,
    bool containedInkWell = false,
    RectCallback? rectCallback,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    double? radius,
    VoidCallback? onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
      onRemoved: onRemoved,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    required super.controller,
    required super.referenceBox,
    required super.color,
    super.onRemoved,
  });

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}

/*class WhiteButton extends StatelessWidget {
  final String buttonWord;
  final TextStyle? buttonWordStyle;
  final double? width;
  final double? hight;
  final VoidCallback onPress;

  const WhiteButton({
    super.key,
    required this.buttonWord,
    this.width,
    this.hight,
    required this.onPress,
    this.buttonWordStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight ?? 48.h,
      width: width ?? 352.w,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: TColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
              side: BorderSide(
                  color: TColors.lightblue, width: 2.w, style: BorderStyle.solid
                  //  strokeAlign: StrokeAlign.outside,
                  )),
        ),
        child: Text(
          buttonWord,
          style: buttonWordStyle ??
              TFonts.cairo(
                fontSize: TFontSizes.f16,
                fontWeight: TFontWights.semibold,
                color: TColors.lightblue,
              ),
        ),
      ),
    );
  }
}*/
