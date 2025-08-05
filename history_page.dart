import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<String> transactions;
  const HistoryPage({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text("سجل المعاملات")),
        body: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.compare_arrows),
              title: Text(transactions[index]),
            );
          },
        ),
      ),
    );
  }
}
