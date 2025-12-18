import 'package:weather_app/data/const/export.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(12.h),
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: CustomColors.backButton),
              child: SvgPicture.asset("assets/svg/back.svg"))),
    );
  }
}
