// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: OverviewPage(),
//     );
//   }
// }

// class OverviewPage extends StatefulWidget {
//   const OverviewPage({super.key});

//   @override
//   State<OverviewPage> createState() => _OverviewPageState();
// }

// class _OverviewPageState extends State<OverviewPage> {
//   String _selectedPeriod = "Daily"; // Default view is "Daily"
//   List<BarChartGroupData> _barChartData = _getDailyData();

//   // Dummy chart data for each period
//   static List<BarChartGroupData> _getDailyData() {
//     return [
//       _buildBarGroup(0, 5, false),
//       _buildBarGroup(1, 6, false),
//       _buildBarGroup(2, 6.5, false),
//       _buildBarGroup(3, 7, false),
//       _buildBarGroup(4, 7.5, false),
//       _buildBarGroup(5, 8, false),
//       _buildBarGroup(6, 10, true),
//     ];
//   }

//   static List<BarChartGroupData> _getWeeklyData() {
//     return [
//       _buildBarGroup(0, 30, false),
//       _buildBarGroup(1, 35, false),
//       _buildBarGroup(2, 40, false),
//       _buildBarGroup(3, 45, false),
//       _buildBarGroup(4, 50, false),
//       _buildBarGroup(5, 55, false),
//       _buildBarGroup(6, 60, true),
//     ];
//   }

//   static List<BarChartGroupData> _getMonthlyData() {
//     return [
//       _buildBarGroup(0, 100, false),
//       _buildBarGroup(1, 120, false),
//       _buildBarGroup(2, 130, false),
//       _buildBarGroup(3, 140, false),
//       _buildBarGroup(4, 150, false),
//       _buildBarGroup(5, 160, false),
//       _buildBarGroup(6, 180, true),
//     ];
//   }

//   static List<BarChartGroupData> _getYearlyData() {
//     return [
//       _buildBarGroup(0, 2000, false),
//       _buildBarGroup(1, 2200, false),
//       _buildBarGroup(2, 2400, false),
//       _buildBarGroup(3, 2600, false),
//       _buildBarGroup(4, 2800, false),
//       _buildBarGroup(5, 3000, false),
//       _buildBarGroup(6, 3500, true),
//     ];
//   }

//   static BarChartGroupData _buildBarGroup(int x, double y, bool isHighlighted) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           color: isHighlighted
//               ? const Color.fromARGB(255, 91, 234, 220)
//               : Colors.grey[400],
//           width: 10,
//           borderRadius: isHighlighted
//               ? const BorderRadius.only(
//                   topLeft: Radius.circular(4), topRight: Radius.circular(4))
//               : BorderRadius.zero,
//         ),
//       ],
//       showingTooltipIndicators: isHighlighted ? [0] : [],
//     );
//   }

//   // Update chart data based on selected period
//   void _updateChartData(String period) {
//     setState(() {
//       _selectedPeriod = period;
//       if (period == "Daily") {
//         _barChartData = _getDailyData();
//       } else if (period == "Weekly") {
//         _barChartData = _getWeeklyData();
//       } else if (period == "Monthly") {
//         _barChartData = _getMonthlyData();
//       } else if (period == "Yearly") {
//         _barChartData = _getYearlyData();
//       }
//     });
//   }

//   // Transaction summary based on selected period
//   List<Widget> _getSummary() {
//     if (_selectedPeriod == "Weekly") {
//       return [
//         _buildTransactionTile(
//           icon: Icons.home,
//           label: "House Bills",
//           amount: "-\$50",
//           color: Colors.red,
//           time: "Mon",
//         ),
//         _buildTransactionTile(
//           icon: Icons.music_note,
//           label: "Concert Ticket",
//           amount: "-\$200",
//           color: Colors.red,
//           time: "Tue",
//         ),
//         _buildTransactionTile(
//           icon: Icons.attach_money,
//           label: "Rent Earn",
//           amount: "+\$250",
//           color: Colors.green,
//           time: "Wed",
//         ),
//         _buildTransactionTile(
//           icon: Icons.directions_boat,
//           label: "Boat Income",
//           amount: "+\$350",
//           color: Colors.green,
//           time: "Thu",
//         ),
//       ];
//     } else if (_selectedPeriod == "Monthly") {
//       return [
//         _buildTransactionTile(
//           icon: Icons.home,
//           label: "House Bills",
//           amount: "-\$500",
//           color: Colors.red,
//           time: "1st Week",
//         ),
//         _buildTransactionTile(
//           icon: Icons.music_note,
//           label: "Concert Ticket",
//           amount: "-\$350",
//           color: Colors.red,
//           time: "2nd Week",
//         ),
//         _buildTransactionTile(
//           icon: Icons.attach_money,
//           label: "Rent Earn",
//           amount: "+\$1,000",
//           color: Colors.green,
//           time: "3rd Week",
//         ),
//         _buildTransactionTile(
//           icon: Icons.directions_boat,
//           label: "Boat Income",
//           amount: "+\$9,00",
//           color: Colors.green,
//           time: "4th Week",
//         ),
//       ];
//     } else if (_selectedPeriod == "Yearly") {
//       return [
//         _buildTransactionTile(
//           icon: Icons.home,
//           label: "House Bills",
//           amount: "-\$20,000",
//           color: Colors.red,
//           time: "2023",
//         ),
//         _buildTransactionTile(
//           icon: Icons.music_note,
//           label: "Concert Ticket",
//           amount: "-\$2,500",
//           color: Colors.red,
//           time: "2023",
//         ),
//         _buildTransactionTile(
//           icon: Icons.attach_money,
//           label: "Rent Earn",
//           amount: "+\$36,000",
//           color: Colors.green,
//           time: "2023",
//         ),
//         _buildTransactionTile(
//           icon: Icons.directions_boat,
//           label: "Boat Income",
//           amount: "+\$45,000",
//           color: Colors.green,
//           time: "2023",
//         ),
//       ];
//     } else {
//       // Default "Daily"
//       return [
//         _buildTransactionTile(
//           icon: Icons.home,
//           label: "House Bills",
//           amount: "-\$10",
//           color: Colors.red,
//           time: "11:00 am",
//         ),
//         _buildTransactionTile(
//           icon: Icons.music_note,
//           label: "Concert Ticket",
//           amount: "-\$100",
//           color: Colors.red,
//           time: "01:00 pm",
//         ),
//         _buildTransactionTile(
//           icon: Icons.attach_money,
//           label: "Rent Earn",
//           amount: "+\$3,000",
//           color: Colors.green,
//           time: "02:30 pm",
//         ),
//         _buildTransactionTile(
//           icon: Icons.directions_boat,
//           label: "Boat Income",
//           amount: "+\$4,500",
//           color: Colors.green,
//           time: "04:00 pm",
//         ),
//       ];
//     }
//   }

//   Widget _buildTransactionTile({
//     required IconData icon,
//     required String label,
//     required String amount,
//     required Color color,
//     required String time,
//   }) {
//     return ListTile(
//       leading: Icon(icon, size: 32, color: color),
//       title: Text(label, style: const TextStyle(fontSize: 14)),
//       subtitle: Text(time,
//           style: const TextStyle(color: Color.fromARGB(255, 213, 138, 138))),
//       trailing: Text(
//         amount,
//         style:
//             TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildToggleButton(String label, bool isSelected) {
//     return GestureDetector(
//       onTap: () => _updateChartData(label),
//       child: Container(
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.teal : Colors.grey[300],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: isSelected ? Colors.white : Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//         title: const Text(
//           "Dashboard",
//           style: TextStyle(color: Colors.black, fontSize: 20),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildToggleButton("Daily", _selectedPeriod == "Daily"),
//                 _buildToggleButton("Weekly", _selectedPeriod == "Weekly"),
//                 _buildToggleButton("Monthly", _selectedPeriod == "Monthly"),
//                 _buildToggleButton("Yearly", _selectedPeriod == "Yearly"),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Overview",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             AspectRatio(
//               aspectRatio: 1.5,
//               child: BarChart(
//                 BarChartData(
//                   barGroups: _barChartData,
//                   borderData: FlBorderData(show: false),
//                   gridData: const FlGridData(show: false),
//                   titlesData: const FlTitlesData(show: true),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               "Summary",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             Expanded(
//               child: ListView(children: _getSummary()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      home: OverviewPage(),
    );
  }
}

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  String _selectedPeriod = "Daily"; // Default view is "Daily"
  List<BarChartGroupData> _barChartData = _getDailyData();

  // Dummy chart data for each period
  static List<BarChartGroupData> _getDailyData() {
    return [
      _buildBarGroup(0, 5, false),
      _buildBarGroup(1, 6, false),
      _buildBarGroup(2, 6.5, false),
      _buildBarGroup(3, 7, false),
      _buildBarGroup(4, 7.5, false),
      _buildBarGroup(5, 8, false),
      _buildBarGroup(6, 10, true),
    ];
  }

  static List<BarChartGroupData> _getWeeklyData() {
    return [
      _buildBarGroup(0, 30, false),
      _buildBarGroup(1, 35, false),
      _buildBarGroup(2, 40, false),
      _buildBarGroup(3, 45, false),
      _buildBarGroup(4, 50, false),
      _buildBarGroup(5, 55, false),
      _buildBarGroup(6, 60, true),
    ];
  }

  static List<BarChartGroupData> _getMonthlyData() {
    return [
      _buildBarGroup(0, 100, false),
      _buildBarGroup(1, 120, false),
      _buildBarGroup(2, 130, false),
      _buildBarGroup(3, 140, false),
      _buildBarGroup(4, 150, false),
      _buildBarGroup(5, 160, false),
      _buildBarGroup(6, 180, true),
    ];
  }

  static List<BarChartGroupData> _getYearlyData() {
    return [
      _buildBarGroup(0, 2000, false),
      _buildBarGroup(1, 2200, false),
      _buildBarGroup(2, 2400, false),
      _buildBarGroup(3, 2600, false),
      _buildBarGroup(4, 2800, false),
      _buildBarGroup(5, 3000, false),
      _buildBarGroup(6, 3500, true),
    ];
  }

  static BarChartGroupData _buildBarGroup(int x, double y, bool isHighlighted) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isHighlighted
              ? const Color.fromARGB(255, 91, 234, 220)
              : Colors.grey[400],
          width: 10,
          borderRadius: isHighlighted
              ? const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4))
              : BorderRadius.zero,
        ),
      ],
      showingTooltipIndicators: isHighlighted ? [0] : [],
    );
  }

  // Update chart data based on selected period
  void _updateChartData(String period) {
    setState(() {
      _selectedPeriod = period;
      if (period == "Daily") {
        _barChartData = _getDailyData();
      } else if (period == "Weekly") {
        _barChartData = _getWeeklyData();
      } else if (period == "Monthly") {
        _barChartData = _getMonthlyData();
      } else if (period == "Yearly") {
        _barChartData = _getYearlyData();
      }
    });
  }

  // Transaction summary based on selected period
  List<Widget> _getSummary() {
    if (_selectedPeriod == "Weekly") {
      return [
        _buildTransactionTile(
          icon: Icons.home,
          label: "House Bills",
          amount: "-\$50",
          color: Colors.red,
          time: "Mon",
        ),
        _buildTransactionTile(
          icon: Icons.music_note,
          label: "Concert Ticket",
          amount: "-\$200",
          color: Colors.red,
          time: "Tue",
        ),
        _buildTransactionTile(
          icon: Icons.attach_money,
          label: "Rent Earn",
          amount: "+\$250",
          color: Colors.green,
          time: "Wed",
        ),
        _buildTransactionTile(
          icon: Icons.directions_boat,
          label: "Boat Income",
          amount: "+\$350",
          color: Colors.green,
          time: "Thu",
        ),
      ];
    } else if (_selectedPeriod == "Monthly") {
      return [
        _buildTransactionTile(
          icon: Icons.home,
          label: "House Bills",
          amount: "-\$500",
          color: Colors.red,
          time: "1st Week",
        ),
        _buildTransactionTile(
          icon: Icons.music_note,
          label: "Concert Ticket",
          amount: "-\$350",
          color: Colors.red,
          time: "2nd Week",
        ),
        _buildTransactionTile(
          icon: Icons.attach_money,
          label: "Rent Earn",
          amount: "+\$1,000",
          color: Colors.green,
          time: "3rd Week",
        ),
        _buildTransactionTile(
          icon: Icons.directions_boat,
          label: "Boat Income",
          amount: "+\$9,00",
          color: Colors.green,
          time: "4th Week",
        ),
      ];
    } else if (_selectedPeriod == "Yearly") {
      return [
        _buildTransactionTile(
          icon: Icons.home,
          label: "House Bills",
          amount: "-\$20,000",
          color: Colors.red,
          time: "2023",
        ),
        _buildTransactionTile(
          icon: Icons.music_note,
          label: "Concert Ticket",
          amount: "-\$2,500",
          color: Colors.red,
          time: "2023",
        ),
        _buildTransactionTile(
          icon: Icons.attach_money,
          label: "Rent Earn",
          amount: "+\$36,000",
          color: Colors.green,
          time: "2023",
        ),
        _buildTransactionTile(
          icon: Icons.directions_boat,
          label: "Boat Income",
          amount: "+\$45,000",
          color: Colors.green,
          time: "2023",
        ),
      ];
    } else {
      // Default "Daily"
      return [
        _buildTransactionTile(
          icon: Icons.home,
          label: "House Bills",
          amount: "-\$10",
          color: Colors.red,
          time: "11:00 am",
        ),
        _buildTransactionTile(
          icon: Icons.music_note,
          label: "Concert Ticket",
          amount: "-\$100",
          color: Colors.red,
          time: "01:00 pm",
        ),
        _buildTransactionTile(
          icon: Icons.attach_money,
          label: "Rent Earn",
          amount: "+\$3,000",
          color: Colors.green,
          time: "02:30 pm",
        ),
        _buildTransactionTile(
          icon: Icons.directions_boat,
          label: "Boat Income",
          amount: "+\$4,500",
          color: Colors.green,
          time: "04:00 pm",
        ),
      ];
    }
  }

  Widget _buildTransactionTile({
    required IconData icon,
    required String label,
    required String amount,
    required Color color,
    required String time,
  }) {
    return ListTile(
      leading: Icon(icon, size: 32, color: color),
      title: Text(label, style: const TextStyle(fontSize: 14)),
      subtitle: Text(time,
          style: const TextStyle(color: Color.fromARGB(255, 213, 138, 138))),
      trailing: Text(
        amount,
        style:
            TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildToggleButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () => _updateChartData(label),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.teal : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Overview",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        // Removed the `leading` property to remove the top left icon
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildToggleButton("Daily", _selectedPeriod == "Daily"),
                _buildToggleButton("Weekly", _selectedPeriod == "Weekly"),
                _buildToggleButton("Monthly", _selectedPeriod == "Monthly"),
                _buildToggleButton("Yearly", _selectedPeriod == "Yearly"),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Overview",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  barGroups: _barChartData,
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: true),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Summary",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(children: _getSummary()),
            ),
          ],
        ),
      ),
    );
  }
}
