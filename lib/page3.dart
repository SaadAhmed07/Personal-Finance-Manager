import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedPeriod = "Monthly"; // Default period
  DateTimeRange? _selectedDateRange;

  // Data for each period
  List<BarChartGroupData> _getBarData() {
    switch (_selectedPeriod) {
      case "Weekly":
        return [
          _buildBarGroup(0, 3, 2),
          _buildBarGroup(1, 4, 3),
          _buildBarGroup(2, 5, 4),
          _buildBarGroup(3, 6, 5),
        ];
      case "Yearly":
        return [
          _buildBarGroup(0, 100, 80),
          _buildBarGroup(1, 120, 90),
          _buildBarGroup(2, 150, 110),
          _buildBarGroup(3, 170, 130),
        ];
      case "Monthly":
      default:
        return [
          _buildBarGroup(0, 9, 7),
          _buildBarGroup(1, 8, 6),
          _buildBarGroup(2, 7, 5),
          _buildBarGroup(3, 7.5, 6),
          _buildBarGroup(4, 8.5, 6.5),
        ];
    }
  }

  // Open Date Range Picker
  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
      initialDateRange: _selectedDateRange,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.teal,
            hintColor: Colors.teal,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
        // Based on the selected date range, update the period
        final duration = picked.duration.inDays;
        if (duration <= 7) {
          _selectedPeriod = 'Weekly';
        } else if (duration <= 31) {
          _selectedPeriod = 'Monthly';
        } else {
          _selectedPeriod = 'Yearly';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.black),
            onPressed: _selectDateRange,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Income and Expenses Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIncomeExpenseTile(
                  icon: Icons.download,
                  amount: "\$15,000",
                  label: "Income",
                  color: Colors.teal,
                ),
                _buildIncomeExpenseTile(
                  icon: Icons.upload,
                  amount: "\$8,500",
                  label: "Expenses",
                  color: Colors.redAccent,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Toggle Buttons for Time Period
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildToggleButton("Weekly", _selectedPeriod == "Weekly"),
                _buildToggleButton("Monthly", _selectedPeriod == "Monthly"),
                _buildToggleButton("Yearly", _selectedPeriod == "Yearly"),
              ],
            ),
            const SizedBox(height: 16),

            // Bar Chart Section
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  barGroups: _getBarData(),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          List<String> labels;
                          switch (_selectedPeriod) {
                            case "Weekly":
                              labels = ['W1', 'W2', 'W3', 'W4'];
                              break;
                            case "Yearly":
                              labels = ['2020', '2021', '2022', '2023'];
                              break;
                            case "Monthly":
                            default:
                              labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
                              break;
                          }
                          return Text(
                            labels[value.toInt() % labels.length],
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Icons for Income and Expenses
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconLabel(
                    icon: Icons.download, label: "Income", color: Colors.teal),
                const SizedBox(width: 40), // Space between the two icons
                _buildIconLabel(
                    icon: Icons.upload, label: "Expenses", color: Colors.grey),
              ],
            ),
            const SizedBox(height: 16),

            // Congratulatory Message
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Congratulations! Your income increased by 40% in the second half of this year.",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeExpenseTile({
    required IconData icon,
    required String amount,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, size: 32, color: color),
        const SizedBox(height: 8),
        Text(
          amount,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPeriod = label;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconLabel(
      {required IconData icon, required String label, required Color color}) {
    return Column(
      children: [
        Icon(icon, size: 30, color: color),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  BarChartGroupData _buildBarGroup(int x, double income, double expense) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: income, color: Colors.teal, width: 8),
        BarChartRodData(toY: expense, color: Colors.grey, width: 8),
      ],
      barsSpace: 4,
    );
  }
}
