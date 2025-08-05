import 'package:flutter/material.dart';
import '../constants.dart';
import 'transfer_page.dart';
import 'history_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  final double balance;
  const HomePage({super.key, required this.balance});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double currentBalance = initialBalance;
  List<String> transactions = [
    "تحويل 50\$ - 2025/07/12",
    "تحويل 25\$ - 2025/07/10",
    "استقبال 30\$ - 2025/07/08"
  ];

  void _navigateToTransfer() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TransferPage()),
    );
    if (result != null && result is double) {
      setState(() {
        currentBalance -= result;
        transactions.insert(
            0, "تحويل $result\$ - ${DateTime.now().toString().split('.')[0]}");
      });
    }
  }

  void _navigateToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryPage(transactions: transactions),
      ),
    );
  }

  void _navigateToSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text("RedotPay")),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('الرئيسية'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.transform),
                title: const Text('التحويل'),
                onTap: _navigateToTransfer,
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('سجل المعاملات'),
                onTap: _navigateToHistory,
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('الإعدادات'),
                onTap: _navigateToSettings,
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('تسجيل الخروج'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "بطاقة الرصيد",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "الرصيد الحالي: \$${currentBalance.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _navigateToTransfer,
                    icon: const Icon(Icons.send),
                    label: const Text("التحويل"),
                  ),
                  ElevatedButton.icon(
                    onPressed: _navigateToHistory,
                    icon: const Icon(Icons.history),
                    label: const Text("سجل المعاملات"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
