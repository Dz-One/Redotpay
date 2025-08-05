import 'package:flutter/material.dart';
import 'transfer_page.dart';
import 'transactions_page.dart';

double balance = 263.0; // ← الرصيد الافتراضي (غيره هنا بسهولة)

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RedotPay")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text("Your Balance"),
                subtitle: Text("\$${balance.toStringAsFixed(2)}", style: const TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TransferPage()));
              },
              icon: const Icon(Icons.send),
              label: const Text("Transfer"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const TransactionsPage()));
              },
              icon: const Icon(Icons.history),
              label: const Text("Transactions"),
            ),
          ],
        ),
      ),
    );
  }
}