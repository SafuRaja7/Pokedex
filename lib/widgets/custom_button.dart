// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dexplatassesment/configs/app_dimensions.dart';
import 'package:dexplatassesment/configs/app_typography.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  const CustomButton({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.normalize(20),
      width: AppDimensions.normalize(130),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        text!,
        style: AppText.h2b!.copyWith(color: Colors.white),
      )),
    );
  }
}
