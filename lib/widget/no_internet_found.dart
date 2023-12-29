import 'package:flutter/material.dart';

class NoInternetFound extends StatelessWidget {
  const NoInternetFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Data not found'),
      ),
    );
  }
}
