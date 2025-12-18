import 'dart:io';

import 'package:weather_app/data/const/export.dart';

import '../../../data/remote_data/core.dart';

class CustomImageNetwork extends StatelessWidget {
  CustomImageNetwork({
    required this.path,
    this.height = 100,
    this.width = 100,
    this.fit = BoxFit.fill,
    Key? key,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor = Colors.white,
    this.color,
    this.onError,
    this.padding,
  }) : super(key: key);
  String path;
  double height;
  double width;
  BoxFit fit;
  BorderRadius borderRadius;
  Color? backgroundColor;
  Color? color;
  Widget? onError;
  EdgeInsets? padding;

  // final String load1 = 'assets/icons/Spinner-1s-200px.gif';
  final String load2 = 'assets/lotties/load1.gif';
  //final String load3 = 'assets/svg/logo.svg';
  //final String load4 = 'assets/lotties/loading.gif';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: isSvgPath(path: path)
          ? Container(
              color: backgroundColor,
              height: height,
              width: width,
              padding: padding ?? const EdgeInsets.all(10.0),
              child: !isLocalPath(path)
                  ? SvgPicture.network(
                      "${getPath(path)}",
                      height: height,
                      width: width,
                      fit: fit,
                      color: color,
                      placeholderBuilder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          color: CustomColors.accentLight,
                         child: CircularProgressIndicator()

                          // child: SvgPicture.asset(
                          //   "assets/svg/logo.svg",
                          //   width: 50,
                          //   height: 50,
                          // ),
                        );
                      },
                      /*      AdvancedNetworkSvg(
                          "${getPath(path)}",
                          useDiskCache: true,
                          (theme) => (bytes, colorFilter, key) {
                                print('colorFilter:: ${colorFilter}');
                                return svg.svgPictureDecoder(
                                  bytes ?? Uint8List.fromList(const []),
                                  false,
                                  colorFilter,
                                  key,
                                );
                              }, loadFailedCallback: () {
                        return SvgPicture.asset(
                          "assets/svg/about_us.svg",
                          fit: BoxFit.scaleDown,
                          width: 24,
                          height: 24,
                        );
                      }),*/
                    )
                  : SvgPicture.asset(path,
                      height: height,
                      width: width,
                      fit: fit, placeholderBuilder: (BuildContext context) {
                      return SvgPicture.asset("assets/svg/splash.svg");
                    }),
            )
          : !isLocalPath(path)
              ? FadeInImage(
                  height: height,
                  width: width,
                  // for loading
                  placeholderFit: BoxFit.scaleDown,
                  placeholder: AssetImage(load2),
                  image: NetworkImage(
                    "${getPath(path)}",
                    scale: 0.5,
                    headers: {
                      HttpHeaders.authorizationHeader: "Bearer test_token"
                    },
                  ),
                  fit: fit,
                  imageErrorBuilder: (context, error, st) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child:
                            onError ?? SvgPicture.asset("assets/svg/logo.svg"));
                  },
                )
              : Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: CustomColors.accentLight,
                    borderRadius: borderRadius,
                    image: DecorationImage(
                      image: AssetImage(
                        path,
                      ),
                      fit: fit,
                    ),
                  ),
                ),
    );
  }

  getPath(String? path) {
    if (path.toString().contains('http')) {
      return path;
    } else {
      return imageDomain() + path.toString();
    }
  }

  bool isSvgPath({String? path = ""}) {
    bool isSVG = path?.contains('.svg') ?? false;
   // sPrint.warning('isSVG:: $isSVG');
    return isSVG;
  }


// bool isSvgPath(String? path) {
//   final isSVG = (path ?? "").toLowerCase().endsWith('.svg');
//   sPrint.warning('isSVG:: $isSVG');
//   return isSVG;
// }

  bool isLocalPath(String path) {
    return path.startsWith("assets");
  }
}
