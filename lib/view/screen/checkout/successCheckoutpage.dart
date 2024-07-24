import 'package:ecommerceproject2/core/constant/appasset.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class SuccessChackoutPage extends StatelessWidget {
  const SuccessChackoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
    Lottie.asset(AppAsset.checked, repeat: false , width: 300),
      ],
    );
  }
}
