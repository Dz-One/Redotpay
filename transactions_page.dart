import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> transactions = [
      {"type": "Received", "amount": "\$150.00", "date": "2025-08-01"},
      {"type": "Sent", "amount": "\$50.00", "date": "2025-08-02"},
      {"type": "Received", "amount": "\$200.00", "date": "2025-08-03"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Transactions")),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return ListTile(
            leading: Icon(tx["type"] == "Received" ? Icons.arrow_downward : Icons.arrow_upward),
            title: Text("\${tx["type"]}: \${tx["amount"]}"),
            subtitle: Text(tx["date"]!),
          );
        },
      ),
    );
  }
}