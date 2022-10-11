import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
          key: const Key('lottie'),
          'https://assets3.lottiefiles.com/packages/lf20_debgr4jk.json'),
    );
  }
}
