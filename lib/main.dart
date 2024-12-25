import 'package:flutter/material.dart';
import 'package:personal_finance_manager/page1.dart';
import 'package:personal_finance_manager/page2.dart';
import 'package:personal_finance_manager/page3.dart';
import 'package:personal_finance_manager/page4.dart';
import 'package:personal_finance_manager/page5.dart';
// Future<void> main() async {

// }
Future<void> main() async {
  runApp(const FinanceApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FinanceApp());
  runApp(const FinanceApp());
}

class Firebase {
  static initializeApp() {}
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FinanceDashboard(),
    const BalancePage(),
    const DashboardPage(), // Loaded from page3.dart
    const OverviewPage(),
    const ExpensePage(),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDrawerItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text('Finance Manager'),
      ),
      body: _pages[_selectedIndex],
      drawer: _buildDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Balance'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.view_list), label: 'Overview'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Expense'),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.teal),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _onDrawerItemTapped(0),
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('Balance'),
            onTap: () => _onDrawerItemTapped(1),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () => _onDrawerItemTapped(2),
          ),
          ListTile(
            leading: const Icon(Icons.view_list),
            title: const Text('Overview'),
            onTap: () => _onDrawerItemTapped(3),
          ),
          ListTile(
            leading: const Icon(Icons.money),
            title: const Text('Expense'),
            onTap: () => _onDrawerItemTapped(4),
          ),
        ],
      ),
    );
  }
}
