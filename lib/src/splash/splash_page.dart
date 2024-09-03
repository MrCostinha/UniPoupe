import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF690BA3),
      child: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
