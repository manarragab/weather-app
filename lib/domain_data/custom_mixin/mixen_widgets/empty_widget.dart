import 'package:weather_app/data/const/export.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({this.onTap, Key? key}) : super(key: key);
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImage.asset(
                'assets/svg/empty-folder.png',
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                CustomTrans.foundNoData.tr,
                style: TFonts.cardBody(
                  color: Colors.black,
                  fontWeight: TFontWights.regular,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
