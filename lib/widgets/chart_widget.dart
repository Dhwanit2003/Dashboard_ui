import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../utils/responsive.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    // Dynamically adjust chart height and text size
    final chartHeight = isMobile ? 180.0 : isTablet ? 250.0 : 200.0;
    final titleTextSize = isMobile ? 12.0 : 14.0;
    final subtitleTextSize = isMobile ? 10.0 : 12.0;

    return Card(
      elevation: 4, // Elevation for shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      margin: const EdgeInsets.all(16.0), // Space around the card
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              children: [
                Text(
                  'Overall Performance ',
                  style: TextStyle(
                    fontSize: titleTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  '- Pending Done',
                  style: TextStyle(
                    fontSize: subtitleTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  '- Project Done',
                  style: TextStyle(
                    fontSize: subtitleTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0), // Space between text and chart
            // Chart container
            Container(
              height: chartHeight,
              width: double.infinity, // Make the chart container stretch
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false), // Disable grid lines
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      left: BorderSide(color: Colors.black, width: 1),
                      bottom: BorderSide(color: Colors.black, width: 1),
                      top: BorderSide.none,
                      right: BorderSide.none,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: isMobile ? 30 : 40,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final yearLabels = ['2015', '2016', '2017', '2018', '2019', '2020'];
                          if (value.toInt() >= 0 && value.toInt() < yearLabels.length) {
                            return Text(
                              yearLabels[value.toInt()],
                              style: TextStyle(
                                fontSize: subtitleTextSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: isMobile ? 30 : 40,
                        interval: 10,
                        getTitlesWidget: (value, meta) {
                          if (value % 10 == 0 && value > 0 && value <= 50) {
                            return Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                fontSize: subtitleTextSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: [
                        FlSpot(0, 30),
                        FlSpot(1, 20),
                        FlSpot(2, 30),
                        FlSpot(3, 40),
                        FlSpot(4, 30),
                        FlSpot(5, 20),
                      ],
                      color: Colors.blue,
                      barWidth: isMobile ? 2 : 4, // Reduce bar width for mobile
                    ),
                    LineChartBarData(
                      isCurved: true,
                      spots: [
                        FlSpot(0, 20),
                        FlSpot(1, 10),
                        FlSpot(2, 50),
                        FlSpot(3, 40),
                        FlSpot(4, 20),
                        FlSpot(5, 30),
                      ],
                      color: Colors.red,
                      barWidth: isMobile ? 2 : 4, // Reduce bar width for mobile
                    ),
                  ],
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
