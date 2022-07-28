import 'package:dexplatassesment/configs/app_dimensions.dart';
import 'package:dexplatassesment/configs/app_typography.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.normalize(20),
      width: AppDimensions.normalize(130),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        'Login',
        style: AppText.h2b!.copyWith(color: Colors.white),
      )),
    );
  }
}
