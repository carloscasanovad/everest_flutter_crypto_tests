import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/app_colors.dart';

class DefaultLoadingSpinner extends StatelessWidget {
  const DefaultLoadingSpinner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key("centerSpinner"),
      child: SpinKitFadingCube(
        key: Key("loadingSpinner"),
        color: kDefaultRed,
        size: 50.0,
      ),
    );
  }
}
