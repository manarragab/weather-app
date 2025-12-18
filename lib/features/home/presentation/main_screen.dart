
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/home/presentation/screens_body/home_body.dart';
import 'package:weather_app/features/home/presentation/screens_body/setting_body.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  //MainGetxController controller = Get.find<MainGetxController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex==1? 
      CustomAppBar.appBar(Text(CustomTrans.setting.tr ,style:  TFonts.kavoonFont( fontSize: 20),) ,   ): 
      CustomAppBar.homeAppBar(onChange: (val) {} , actionWidget:
      
  GetBuilder<MainGetxController>(
  builder: (controller) => Switch(
    value: controller.isDark,
    onChanged: (val) {
      controller.toggleTheme(val);
    },
    activeColor: Colors.indigo,
  ),
),
  
  
   ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.indigo,
        unselectedLabelStyle: TextStyle(color: Colors.grey),

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          
        },
        items:  [
          BottomNavigationBarItem(

            icon: Icon(Icons.home, color: Colors.indigo),
            label: CustomTrans.home.tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.indigo),
            label: CustomTrans.setting.tr,
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex ,
        children: [
          HomeBody(),
          SettingBody(),
        ],
      )
    );
  }
}
