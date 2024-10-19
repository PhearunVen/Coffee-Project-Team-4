import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  // Sample data for sales reports
  final List<double> salesData = [
    100,
    150,
    300,
    500,
    250,
    700,
    850
  ]; // Weekly sales data for example
  DateTimeRange? selectedDateRange;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  // Staff performance data
  final List<Map<String, dynamic>> staffPerformance = [
    {'name': 'John Doe', 'orders': 120},
    {'name': 'Jane Smith', 'orders': 95},
    {'name': 'Tom Clark', 'orders': 75},
  ];

  // Pick a date range
  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDateRange) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Reports',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _selectDateRange(context),
              child: Text(selectedDateRange == null
                  ? 'Select Date Range'
                  : '${dateFormat.format(selectedDateRange!.start)} - ${dateFormat.format(selectedDateRange!.end)}'),
            ),
            const SizedBox(height: 20),
            _buildSalesChart(),
            const SizedBox(height: 20),
            const Text(
              'Staff Performance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: _buildStaffPerformanceChart(),
            ),
          ],
        ),
      ),
    );
  }

  // Build Sales Line Chart
  Widget _buildSalesChart() {
    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: salesData.asMap().entries.map((entry) {
                return FlSpot(entry.key.toDouble(), entry.value);
              }).toList(),
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.3),
              ),
            ),
          ],
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 100,
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Build Staff Performance Bar Chart
  Widget _buildStaffPerformanceChart() {
    return SizedBox(
      height: 250,
      child: BarChart(
        BarChartData(
          barGroups: staffPerformance.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value['orders'].toDouble(), // Updated here
                  color: Colors.green,
                  width: 15,
                ),
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 20,
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final int index = value.toInt();
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(staffPerformance[index]['name']),
                  );
                },
                reservedSize: 60,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
