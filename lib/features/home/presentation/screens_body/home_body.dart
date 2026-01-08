import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weather_app/data/const/export.dart';
import 'package:weather_app/data/remote_data/core.dart';
import 'package:weather_app/features/home/domain/controller/home_controller.dart';
import 'package:weather_app/features/home/presentation/widget/hour.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    //HomeController controller = Get.find<HomeController>();
    return  SmartRefresher(
      onRefresh: controller.onRefresh,
      controller: controller.refreshController,
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: SingleChildScrollView(
      child: Column(
        children: [
              
                  Container(
                    height: Get.height * 1/2,
                    width: Get.width,
              
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400,
                          spreadRadius: 5,
                          blurRadius: 8,
                          offset: const Offset(1, 1),
                        ),
                      ],
                      color: Colors.grey.shade200,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                       
                        const SizedBox(height: 10),
                        Obx(() {
                          final time = controller.now.value;
                          return Center(
                            child: Text(
                              "(${time.toString().substring(0, 10)}) ${DateFormat('EEE').format(time)} (${DateFormat('hh').format(time)}:${DateFormat('mm').format(time)})  ${DateFormat('a').format(time)}",
                              style: const TextStyle(
                                color: CustomColors.blueee,
                              ),
                            ),
                          );
                        }),
                        //         MainButton(onPressed: (){
                        //       controller.getWeather();
                        // controller. getForcastWeather();
                        //      //print("${controller.forecastWeather?.length}");
                        //     print("####### ${controller.weather?.current?.tempC }");
                        //     },
                        //     title: "data",
                        //     ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: Get.width,
                          height: 200,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Cloudy text
                              Positioned(
                                top: 0,
                                child: Text(
                                  "${controller.weather?.current?.condition?.text ?? ""}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
              
                              // Temperature
                              Text(
                                "${controller.weather?.current?.tempC ?? ""}°",
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 80,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
              
                              Positioned(
                                bottom: 8,
                                left: 200,
              
                                child:
                                    controller
                                            .weather
                                            ?.current
                                            ?.condition
                                            ?.icon !=
                                        null
                                    ? CustomImage.network(
                                        controller
                                                    .weather
                                                    ?.current
                                                    ?.condition
                                                    ?.icon !=
                                                null
                                            ? "https:${controller.weather!.current!.condition!.icon}"
                                            : demoImage,
                                      )
                                    : ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Color.fromARGB(
                                                255,
                                                196,
                                                236,
                                                255,
                                              ),
                                              CustomColors.babyblue,
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ).createShader(bounds);
                                        },
                                        child: const Icon(
                                          Icons.cloud,
                                          size: 90,
                                          color: Colors
                                              .white, // Must be white for ShaderMask
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
              
                        const SizedBox(height: 20),
              
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: CustomColors.lightPurple,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                blurStyle: BlurStyle.outer,
                                blurRadius: 8,
                                spreadRadius: 3,
                                color: Colors.grey.shade400,
                                offset: const Offset(-1, 0),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              weatherInfo(
                                Icons.umbrella_outlined,
                                "${controller.weather?.current?.precipMm?.toInt() ?? ""} %",
                               CustomTrans.precipitation.tr,
                              ),
                              weatherInfo(
                                Icons.water_drop_outlined,
                                "${controller.weather?.current?.humidity?.toInt() ?? ""} %",
                                CustomTrans.humidity.tr,
                              ),
                              weatherInfo(
                                Icons.air,
                                "${controller.weather?.current?.windchillC?.toInt() ?? ""} km/h",
                                CustomTrans.windSpeed.tr
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              
                  const SizedBox(height: 30),
               
                  Text(
                    "    ${controller.weather?.location?.name ?? ""}  ,  ${controller.weather?.location?.region ?? ""}  ,  ${controller.weather?.location?.country ?? ""}",
              
                    style: TFonts.kavoonFont(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
              
                  SizedBox(height: 30),
                  Container(
                    height: 180,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: HourlyTemperatureChart(),
                  ),
              
                  const SizedBox(height: 20),
              
                  // 🔵 Week Forecast
                   Align(
                     alignment: Alignment.centerLeft,
                     child: Text(
                      "       ${CustomTrans.dayForecast.tr}     ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                                       ),
                   ),
              
                  const SizedBox(height: 15),
              
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(controller.forecastWeather?.length ?? 0, (
                          index,
                        ) {
                          return dayCard(
                            "${controller.forecastWeather?[index].date?.substring(8, 10)}",
                            "${controller.forecastWeather?[index].day?.maxtempC?.toInt() ?? ""}",
                            "${controller.forecastWeather?[index].day?.mintempC?.toInt() ?? ""}",
                            "${controller.forecastWeather?[index].day?.condition?.icon}",
                            "${controller.forecastWeather?[index].day?.condition?.text}",
                          );
                        }),
                      ],
                    ),
                  ),
                ],
                
              ),
              ),
            );
          },
        ),
    );
  }

  // Small sections
  Widget weatherInfo(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.indigo, size: 25),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget dayCard(String day, String max, String min, String icon, String txt) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 10, left: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CustomColors.blueee,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(txt, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 10),
          CustomImage.network(
            icon != null ? "http:${icon}" : demoImage,

            height: 40,
            width: 40,
          ),
          const SizedBox(height: 10),
          Text(
            "$max / $min",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
