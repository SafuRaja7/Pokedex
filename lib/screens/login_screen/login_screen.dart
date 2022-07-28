import 'package:dexplatassesment/configs/configs.dart';
import 'package:dexplatassesment/screens/login_screen/widgets/form_fields.dart';
import 'package:flutter/material.dart';

import '../../configs/app.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: AppDimensions.normalize(150),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/free-vector/tiny-people-turning-bulb-into-socket-idea-lamp-electricity-flat-vector-illustration-brainstorming-creativity_74855-8630.jpg?size=626&ext=jpg&ga=GA1.2.1299849178.1658999473'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              'Login',
              style: AppText.h1b,
            ),
            Space.y1!,
            FormFields(
              hintText: 'Enter Email',
              icon: Icons.email,
              isSecure: false,
            ),
            Space.y1!,
            FormFields(
              hintText: 'Enter Password',
              icon: Icons.lock,
              isSecure: true,
            ),
            Space.y1!,
            const CustomButton(),
          ],
        ),
      ),
    );
  }
}
