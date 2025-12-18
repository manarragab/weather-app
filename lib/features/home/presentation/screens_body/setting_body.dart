import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/features/home/domain/controller/home_controller.dart';
import 'package:weather_app/localization/change_language.dart';
import 'package:weather_app/res/router/pages.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  HomeController controller = Get.find<HomeController>();
  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 15.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(CustomTrans.settings.tr,
                style: TFonts.kavoonFont(fontSize: 25.w, color: Colors.indigo)),  
            Icon(Icons.settings, color: Colors.indigo, size: 30.w),
          ],),
          SizedBox(height: 15.w,),
          Divider(color: Colors.grey),
      
          ListTile(
            leading: container(Colors.grey.shade200, const Icon(Icons.language),),
            title: Text(CustomTrans.language.tr),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.dialog(
                Obx(() {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Radio(
                            value: "english",
                            groupValue: controller.chooseLang.value,
                            onChanged: (val) {
                              controller.chooseLang.value = val!;
                              print(controller.chooseLang.value);
                              TLang.en(true);
                              Get.back();
                            },
                          ),
                          title: Text(CustomTrans.englisg.tr),
                        ),
                        ListTile(
                          leading: Radio(
                            value: "arabic",
                            groupValue: controller.chooseLang.value,
                            onChanged: (val) {
                              controller.chooseLang.value = val!;
                              print(controller.chooseLang.value);
                              TLang.ar(true);
                              Get.back();
                            },
                          ),
      
                          title: Text(CustomTrans.arabic.tr),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
          Divider(color: Colors.grey),
          ListTile(
         leading: container(Colors.red.shade200, const Icon(Icons.logout, color: Colors.red),),
            title: Text(CustomTrans.logout.tr),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
            onTap: () {
              Get.dialog(
                AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          authController.logout();
                        },
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          CustomTrans.logout.tr,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Divider(color: Colors.grey),
      // VerticalDivider(color: Colors.red),                

          ListTile(
         leading: container(Colors.blue.shade200, const Icon(Icons.person_3_outlined, color: Colors.blue),),
            title: Text(CustomTrans.profile.tr),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blue),
            onTap: () {
              Get.toNamed(CustomPage.profilePage);
            },
          ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }


  Widget container(Color color , Widget child) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: color,
        
        shape: BoxShape.circle,
        //borderRadius: BorderRadius.circular(20),
      ),
      child: child ,
    );
  }
}
