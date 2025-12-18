import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:math' as math;

import 'package:weather_app/features/home/domain/controller/home_controller.dart';

  final controller=Get.find<HomeController>();
class HourlyTemperatureChart extends StatelessWidget {
  
  final List<HourlyTemp> temperatures = [
HourlyTemp(hour: '12 AM', temp: controller.weather?.current?.tempC?.toInt() ?? 18),
HourlyTemp(hour: '3 AM', temp: controller.weather?.current?.windchillC?.toInt() ?? 16),
HourlyTemp(hour: '6 AM', temp: controller.weather?.current?.dewpointC?.toInt() ?? 15),
HourlyTemp(hour: '9 AM', temp: controller.weather?.current?.feelslikeC?.toInt() ?? 20),
HourlyTemp(hour: '12 PM', temp: controller.weather?.current?.tempC?.toInt() ?? 28),
HourlyTemp(hour: '3 PM', temp: controller.weather?.current?.heatindexC?.toInt() ?? 32),
HourlyTemp(hour: '6 PM', temp: controller.weather?.current?.feelslikeC?.toInt() ?? 26),
HourlyTemp(hour: '9 PM', temp: controller.weather?.current?.tempC?.toInt() ?? 21),
  ];

  HourlyTemperatureChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxTemp = temperatures.map((e) => e.temp).reduce(math.max);
    final minTemp = temperatures.map((e) => e.temp).reduce(math.min);

    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: temperatures.map((temp) {
          final normalizedHeight = ((temp.temp - minTemp) / (maxTemp - minTemp)) * 80 + 20;
          final isHighest = temp.temp == maxTemp;
          
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${temp.temp}°',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isHighest ? FontWeight.bold : FontWeight.normal,
                    color: isHighest ? Colors.orange : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: normalizedHeight,
                  width: 8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.orange.shade400,
                        Colors.orange.shade200,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  temp.hour,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class HourlyTemp {
  final String hour;
  final int temp;
  HourlyTemp({required this.hour, required this.temp});
}
