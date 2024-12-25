import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinanceDashboard extends StatelessWidget {
  const FinanceDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[850],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cash Craft",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Master Your Finances with our intelligent personal finance manager. Track, analyze, and optimize your money.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Statistics",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 1.5,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                        color: Colors.teal,
                        value: 16.9,
                        title: "16.9%",
                        radius: 50,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.grey,
                        value: 27.2,
                        title: "27.2%",
                        radius: 50,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.cyan,
                        value: 32.1,
                        title: "32.1%",
                        radius: 50,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      PieChartSectionData(
                        color: Colors.lightBlueAccent,
                        value: 23.3,
                        title: "23.3%",
                        radius: 50,
                        titleStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                    sectionsSpace: 4,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  _buildStatisticsItem(
                      color: Colors.teal,
                      label: "Grocery Shopping",
                      percentage: "16.9%"),
                  _buildStatisticsItem(
                      color: Colors.grey,
                      label: "Car Expenses",
                      percentage: "27.2%"),
                  _buildStatisticsItem(
                      color: Colors.cyan,
                      label: "Online Shopping",
                      percentage: "32.1%"),
                  _buildStatisticsItem(
                      color: Colors.lightBlueAccent,
                      label: "Health Expenditures",
                      percentage: "23.3%"),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Cards",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _showAddCardDialog(context, "Visa Card");
                },
                child: const Card(
                  color: Colors.white,
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(Icons.credit_card, color: Colors.teal),
                    title: Text("Visa Card"),
                    subtitle: Text("Click to add details"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  _showAddCardDialog(context, "MasterCard");
                },
                child: const Card(
                  color: Colors.white,
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(Icons.credit_card, color: Colors.grey),
                    title: Text("MasterCard"),
                    subtitle: Text("Click to add details"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatisticsItem({
    required Color color,
    required String label,
    required String percentage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Text(
            percentage,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showAddCardDialog(BuildContext context, String cardType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController cardNumberController =
            TextEditingController();
        final TextEditingController cardBalanceController =
            TextEditingController();

        return AlertDialog(
          title: Text('Add $cardType'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cardNumberController,
                decoration: const InputDecoration(labelText: 'Card Number'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: cardBalanceController,
                decoration: const InputDecoration(labelText: 'Balance'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Logic to save card details can be added here
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
