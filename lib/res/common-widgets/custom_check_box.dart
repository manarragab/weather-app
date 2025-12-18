import 'package:weather_app/data/const/export.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({required this.onTap, this.isChecked = false, Key? key})
      : super(key: key);
  final Function() onTap;
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 2),
        child: Icon(
          isChecked ? Icons.check_box : Icons.check_box_outline_blank,
          size: 20,
        ),
      ),
    );
  }
}
