// import 'dart:io';
// import 'dart:ui';
// import 'package:weather_app/data/const/export.dart';
// import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
// import 'package:weather_app/res/configuration/image/pick_image.dart';
// import 'package:weather_app/res/loading/loading_overlay_widget.dart';

// class ProfileScreen extends GetWidget<AuthController> {
//    ProfileScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.indigo,
//       appBar: CustomAppBar.appBar(
//         Text(CustomTrans.profile.tr, style: TFonts.appBarTitle(fontSize: 20.w)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//            GetBuilder<AuthController>(builder: ((controller){
//             return LoadingOverLay(
//               showLoadingOnly: true,
//               child: Stack(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         boxShadow: [
//                           BoxShadow(
//                             color: CustomColors.lightPurple,
//                             spreadRadius: 5,
//                             blurRadius: 8,
//                             offset: const Offset(0, 0),
//                           ),
//                         ],
//                         color: CustomColors.lightPurple,
//                       ),
              
//                       child: LoadingOverLay(
//                         showLoadingOnly: true,
//                         child: ClipOval(
//                           child: controller.newImage != null
//                               ? CustomImage.network(
//                                   controller.newImage!,
//                                   height: 200,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 )
//                               : CustomImage.network(
//                                   width: 200,
//                                   height: 200,
//                                   controller.userDataa?.profileImage ?? "",
//                                   fit: BoxFit.cover,
//                                 ),
//                         ),
//                       ),
//                     ),
              
//                     Positioned(
//                       right: 0,
//                       bottom: 0,
//                       child: InkWell(
//                         onTap: () async {
//                           final pick = await Pick.pickImage(context);
//                           if (pick != null) {
//                             controller.imageProf = pick;
//                             final String newImage = await controller
//                                 .changeProfileImage(controller.imageProf!);
//                             controller.newImage = newImage;
//                             controller.update();
//                             print(" imageeeeqqqq ${controller.newImage}");
//                           }
//                         },
//                         child: Icon(Icons.cameraswitch, size: 50 , color: const Color.fromARGB(255, 130, 109, 149),),
//                       ),
//                     ),
//                   ],
//                 ),
//             );
//            })  ),
              

//               // Container(
//               //   padding: EdgeInsets.all(20),

//               //   width: Get.width,
//               //   decoration: BoxDecoration(
//               //     boxShadow: [
//               //       BoxShadow(
//               //         color: CustomColors.lightPurple,
//               //         spreadRadius: 6,
//               //         blurRadius: 10,
//               //         offset: const Offset(0, 0),
//               //       ),
//               //     ],

//               //     color: CustomColors.lightPurple,
//               //     borderRadius: BorderRadius.circular(50),
//               //   ),


// Container(
//   height: 250,
//   width: double.infinity,
//   child: ClipRRect(
//     borderRadius: BorderRadius.circular(20),
//     child: BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.2),
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: Colors.white.withOpacity(0.3),
//             width: 1,
//           ),
//         ),
        
  
//                 child: Column(
//                   spacing: 30,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     info("Name:", controller.userDataa?.name ?? ""),
//                     info("Email:", controller.userDataa?.email ?? ""),
//                     info("Phone:", controller.userDataa?.phone ?? ""),
//                     info("Country:", controller.userDataa?.country ?? ""),
//                   ],
//                 ),
//               ),
//     ),
//   ),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget info(  String label, String txt) {
//     return Row(
      
//       children: [
//        Text(
//           label,
//           style: TFonts.montFont(fontSize: 15, fontWeight: FontWeight.normal),
//         ),
//         SizedBox(width: 10),
//          Text(
//             txt,
//             style: TFonts.josefinFont(
//               color: CustomColors.black,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
        
//       ],
//     );
//   }
// }



import 'dart:io';
import 'dart:ui';

import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/features/auth/domain/controller/auth_controller.dart';
import 'package:weather_app/res/configuration/image/pick_image.dart';
import 'package:weather_app/res/loading/loading_overlay_widget.dart';

class ProfileScreen extends GetWidget<AuthController> {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar.appBar(
        Text(
          CustomTrans.profile.tr,
          style: TFonts.kavoonFont(fontSize: 22.w),
        ),
       
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo,
              Color(0xff8A7CFF),
              Color(0xffB39DDB),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 30),

                /// 🌟 PROFILE IMAGE
                GetBuilder<AuthController>(
                  builder: (controller) {
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                  boxShadow: [       BoxShadow(
                      color: CustomColors.lightPurple,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                          
                          
                          ),
                          child: ClipOval(
                            child: LoadingOverLay(
                              showLoadingOnly: true,
                              child: controller.newImage != null
                                  ? CustomImage.network(
                                      controller.newImage!,
                                      height: 180,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    )
                                  : CustomImage.network(
                                      controller.userDataa?.profileImage ?? "",
                                      height: 180,
                                      width: 180,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),

                        /// 📷 CAMERA BUTTON
                        InkWell(
                          onTap: () async {
                            final pick = await Pick.pickImage(context);
                            if (pick != null) {
                              controller.imageProf = pick;
                              final String newImage =
                                  await controller.changeProfileImage(
                                controller.imageProf!,
                              );
                              controller.newImage = newImage;
                              controller.update();
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 26,
                              color: Color(0xff6A5ACD),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 40),

                /// 💎 USER INFO CARD (GLASS EFFECT)
                _glassContainer(
                  child: Column(
                    children: [
                      infoRow(
                        icon: Icons.person,
                        label: "Name",
                        value: controller.userDataa?.name ?? "",
                      ),
                      divider(),
                      infoRow(
                        icon: Icons.email,
                        label: "Email",
                        value: controller.userDataa?.email ?? "",
                      ),
                      divider(),
                      infoRow(
                        icon: Icons.phone,
                        label: "Phone",
                        value: controller.userDataa?.phone ?? "",
                      ),
                      divider(),
                      infoRow(
                        icon: Icons.flag,
                        label: "Country",
                        value: controller.userDataa?.country ?? "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 🌫️ GLASS CONTAINER
  Widget _glassContainer({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.18),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              color: Colors.white.withOpacity(.3),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  /// ℹ️ INFO ROW
  Widget infoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 22),
        const SizedBox(width: 12),
        Text(
          "$label:",
          style: TFonts.montFont(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: TFonts.josefinFont(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Divider(
        color: Colors.white.withOpacity(.3),
        thickness: 1,
      ),
    );
  }
}
