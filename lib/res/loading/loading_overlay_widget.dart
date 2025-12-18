import 'package:weather_app/domain_data/custom_mixin/mixen_widgets/loading_widget.dart';
import 'package:weather_app/domain_data/main_getx_controller/main_getx_controller.dart';
import 'package:weather_app/error/error_widget.dart';
import 'package:weather_app/res/configuration/color.dart';
import 'package:weather_app/res/configuration/print_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../configuration/fonts.dart';

const String loadingID = 'loadingID';
const String loadingIconID = 'loadingIconID';

class LoadingOverLay extends StatelessWidget {
  LoadingOverLay(
      {this.id = loadingID,
      required this.child,
      this.onLoad,
      super.key,
      this.showLoadingOnly = false,
      this.loading});

  Widget child;
  bool showLoadingOnly;
  void Function()? onLoad;
  String id;
  Widget? loading;

  Widget getType(
      LoadingType loadingType, BuildContext context, String progress) {
    switch (loadingType) {
      case LoadingType.show:
        return Container(
          alignment: Alignment.center,
          color: showLoadingOnly
              ? CustomColors.transparent
              : CustomColors.white.withOpacity(0.5),
          child: loading ?? const LoadingWidget(),
        );
        break;
      case LoadingType.hide:
        return showLoadingOnly ? child : Container();
        break;
      case LoadingType.error:
        return Container(
            alignment: Alignment.center,
            color: showLoadingOnly
                ? Colors.transparent
                : CustomColors.white.withOpacity(0.3),
            child: TErrorWidget(
              onTap: onLoad,
            ));
        break;
      case LoadingType.progress:
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            color: showLoadingOnly
                ? CustomColors.white
                : CustomColors.white.withOpacity(0.5),
            child: Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: CustomColors.accent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    loading ?? const LoadingWidget(),
                    Text(
                      progress,
                      style: TFonts.style(
                          color: CustomColors.white,
                          fontWeight: TFontWights.regular,
                          fontSize: TFontSizes.f16),
                    )
                  ],
                )),
          ),
        );
        break;
      case LoadingType.loadingIcon:
        sPrint.info('loading icon');
        return loading ?? const LoadingWidget();
        break;
    }
  }



  @override
  Widget build(BuildContext context) {
   
    if (showLoadingOnly) {
      return GetBuilder<LoadingGetxController>(
          id: id,
          builder: ((controller) {
            sPrint.info('loading controller :: ${controller.loadingType} idddoo $id');
            
            return getType(
                controller.loadingType, context, controller.progress);
          }));
    } else {
      return Stack(
        children: [
          child,
          GetBuilder<LoadingGetxController>(
              id: id,
              builder: ((controller) {
                sPrint.info('loading controller :: ${controller.loadingType}');
                return getType(
                    controller.loadingType, context, controller.progress);
              }))
        ],
      );
    }
  }
}
