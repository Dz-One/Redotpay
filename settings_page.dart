import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text("الإعدادات")),
        body: const Center(
          child: Text("إعدادات التطبيق (اللغة، المظهر...)"),
        ),
      ),
    );
  }
}
