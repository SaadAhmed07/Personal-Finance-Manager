import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensePage(),
    );
  }
}

class ExpensePage extends StatelessWidget {
  const ExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Background for the header section
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        title: const Text(
          "July",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        // Removed the `leading` property to remove the top left icon
      ),
      body: Column(
        children: [
          // Header section with total income
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Income",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  "\$7,500",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Content section with transactions
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Expense progress bar
                  const Text(
                    "All Expenses",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$4,800", style: TextStyle(color: Colors.grey)),
                      Text("54%", style: TextStyle(color: Colors.grey)),
                      Text("\$7,500", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.54,
                    color: Colors.teal,
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(height: 24),

                  // Transactions list
                  const Text(
                    "Transactions",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildTransactionTile(
                          title: "Shopping",
                          date: "2 July 2021",
                          amount: "-\$1,450",
                          amountColor: Colors.red,
                        ),
                        _buildTransactionTile(
                          title: "Bank Loan",
                          date: "4 July 2021",
                          amount: "-\$3,500",
                          amountColor: Colors.red,
                        ),
                        _buildTransactionTile(
                          title: "Transfer to Giles Posture",
                          date: "10 July 2021",
                          amount: "-\$480",
                          amountColor: Colors.red,
                        ),
                        _buildTransactionTile(
                          title: "Church Donation",
                          date: "12 July 2021",
                          amount: "-\$300",
                          amountColor: Colors.red,
                        ),
                        _buildTransactionTile(
                          title: "Car Expenses",
                          date: "15 July 2021",
                          amount: "-\$780",
                          amountColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionTile({
    required String title,
    required String date,
    required String amount,
    required Color amountColor,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        date,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
            fontSize: 14, color: amountColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
