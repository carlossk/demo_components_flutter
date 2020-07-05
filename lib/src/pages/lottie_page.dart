import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottiePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie'),
      ),
      body: Center(
        child: Container(
          child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_frlJkB.json',
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
