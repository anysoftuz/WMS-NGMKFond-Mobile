import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sklad/assets/colors/colors.dart';
import 'package:sklad/utils/my_function.dart';

class WarehouseOccupancy extends StatelessWidget {
  const WarehouseOccupancy({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value1,
    required this.value2,
  });
  final String title;
  final String subtitle;
  final Widget icon;
  final int value1;
  final int value2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: whiteGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: white,
                ),
                padding: const EdgeInsets.all(8),
                child: icon,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.blue,
                        value: value1.toDouble(),
                        title: MyFunction.priceFormat(value1),
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.grey[300],
                        value: value2.toDouble(),
                        title: MyFunction.priceFormat(value2),
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    centerSpaceRadius: 80,
                    sectionsSpace: 8,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyFunction.priceFormat(value1 + value2),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Итого",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Общая вместимость",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Занятое место",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
