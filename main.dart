import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const RedotPayMock());
}

class RedotPayMock extends StatelessWidget {
  const RedotPayMock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedotPay Mock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}