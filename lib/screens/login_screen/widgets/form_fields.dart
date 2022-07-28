// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:dexplatassesment/configs/configs.dart';

import '../../../configs/app.dart';

class FormFields extends StatelessWidget {
  final _formkey = GlobalKey<FormBuilderState>();
  final String hintText;
  final IconData icon;
  final bool isSecure;
  FormFields(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.isSecure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return FormBuilder(
      key: _formkey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Center(
        child: SizedBox(
          width: AppDimensions.normalize(140),
          child: FormBuilderTextField(
            name: 'email',
            decoration: InputDecoration(
                contentPadding: Space.all(5, 0),
                hintText: hintText,
                prefixIcon: Icon(icon),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(width: 1, color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(15),
                )),
            textInputAction: TextInputAction.next,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.email(context),
              FormBuilderValidators.required(context),
            ]),
            obscureText: isSecure,
          ),
        ),
      ),
    );
  }
}
