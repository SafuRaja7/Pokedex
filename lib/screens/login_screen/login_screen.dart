import 'package:dexplatassesment/configs/configs.dart';
import 'package:dexplatassesment/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../configs/app.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../widgets/custom_button.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSecure = true;
  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: ((context, state) {
            return _buildInitialForm();
          }),
          listener: (context, state) {
            if (state is AuthLoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const HomeScreen();
                  }),
                ),
              );
            } else if (state is AuthLoginError) {
              AlertDialog(
                title: const Text('Wrong email or Password'),
                actions: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const CustomButton(
                        text: 'OK',
                      ))
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildInitialForm() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppDimensions.normalize(130),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/free-vector/tiny-people-turning-bulb-into-socket-idea-lamp-electricity-flat-vector-illustration-brainstorming-creativity_74855-8630.jpg?size=626&ext=jpg&ga=GA1.2.1299849178.1658999473'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Space.y1!,
                Padding(
                  padding: Space.all(1, 0),
                  child: Text(
                    'Log In',
                    style: AppText.h1b!.copyWith(fontSize: 30),
                  ),
                ),
                // email field
                Space.y1!,

                Padding(
                  padding: Space.all(1, 0),
                  child: SizedBox(
                    width: AppDimensions.normalize(140),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                          contentPadding: Space.all(5, 0),
                          hintText: 'Email Address',
                          prefixIcon: const Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(context),
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                  ),
                ),
                Space.y1!,

                // password field

                Padding(
                  padding: Space.all(1, 0),
                  child: SizedBox(
                    width: AppDimensions.normalize(140),
                    child: FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(() {
                              _isSecure = !_isSecure;
                            }),
                            child: Icon(_isSecure
                                ? Icons.remove_red_eye
                                : Icons.panorama_fish_eye_sharp),
                          ),
                          contentPadding: Space.all(5, 0),
                          hintText: 'Password',
                          prefixIcon:
                              Icon(_isSecure ? Icons.lock : Icons.lock_open),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(width: 1, color: Colors.black),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      textInputAction: TextInputAction.done,
                      validator: FormBuilderValidators.required(context),
                      obscureText: _isSecure,
                    ),
                  ),
                ),
                Space.y1!,

                // login button

                Padding(
                  padding: Space.all(3, 0),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final authCubit = BlocProvider.of<AuthCubit>(context);
                        await authCubit.login(
                            _formKey.currentState!.fields['email']!.value,
                            _formKey.currentState!.fields['password']!.value);
                      }
                    },
                    child: const CustomButton(
                      text: 'Login',
                    ),
                  ),
                ),
                Space.y1!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account ? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return const SignupScreen();
                            }),
                          ),
                        );
                      },
                      child: Text(
                        'Register Now',
                        style: AppText.h3b!
                            .copyWith(color: Colors.blue, fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
