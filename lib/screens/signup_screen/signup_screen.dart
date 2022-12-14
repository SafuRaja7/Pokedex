import 'package:dexplatassesment/cubits/auth/auth_cubit.dart';
import 'package:dexplatassesment/screens/login_screen/login_screen.dart';
import 'package:dexplatassesment/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../configs/app.dart';
import '../../configs/app_dimensions.dart';
import '../../configs/app_typography.dart';
import '../../configs/space.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final bool _isSecure = true;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          builder: ((context, state) {
            if (state is AuthInitial) {
              return _buildInitialForm();
            } else if (state is AuthSignUpLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AuthSignUpSuccess) {
              return _buildInitialForm();
            } else {
              return _buildInitialForm();
            }
          }),
          listener: (context, state) {
            if (state is AuthSignUpSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Account Created',
                    ),
                  ),
                );
              Navigator.pop(context);
            } else if (state is AuthSignUpError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(state.error!)));
            }
          },
        ),
      ),
    );
  }

  Widget _buildInitialForm() {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(5),
                Padding(
                  padding: Space.all(7.5, 0),
                  child: Icon(
                    Icons.android,
                    size: AppDimensions.normalize(50),
                  ),
                ),
                Space.y1!,

                Container(
                  padding: Space.all(4, 0),
                  margin: Space.all(4.5, 0),
                  child: Text(
                    'HELLO! ',
                    style: AppText.h1b,
                  ),
                ),
                Space.y1!,

                Container(
                  margin: Space.all(5, 0),
                  child: Text(
                    "Welcome To Pokedex!",
                    style: AppText.h2,
                  ),
                ),
                Space.y1!,

                Space.y1!,

                Padding(
                  padding: Space.all(1, 0),
                  child: Container(
                    color: Colors.grey[200],
                    width: AppDimensions.normalize(140),
                    child: FormBuilderTextField(
                      name: 'name',
                      decoration: InputDecoration(
                        contentPadding: Space.all(5, 0),
                        hintText: 'Your Name',
                        prefixIcon: const Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.match(context, r'[a-zA-Z]',
                            errorText: 'Name can only be Alphabets!'),
                        FormBuilderValidators.required(context),
                      ]),
                    ),
                  ),
                ),
                Space.y1!,
                // email field

                Padding(
                  padding: Space.all(1, 0),
                  child: Container(
                    color: Colors.grey[200],
                    width: AppDimensions.normalize(140),
                    child: FormBuilderTextField(
                      name: 'email',
                      decoration: InputDecoration(
                        contentPadding: Space.all(5, 0),
                        hintText: 'Email Address',
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.none,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
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
                  child: Container(
                    color: Colors.grey[200],
                    width: AppDimensions.normalize(140),
                    child: FormBuilderTextField(
                      name: 'password',
                      decoration: InputDecoration(
                          contentPadding: Space.all(5, 0),
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.none,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      textInputAction: TextInputAction.done,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                      ]),
                      obscureText: _isSecure,
                    ),
                  ),
                ),
                Space.y1!,

                // submit button

                Padding(
                  padding: Space.all(3, 0),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final authCubit = BlocProvider.of<AuthCubit>(context);
                        await authCubit.signUp(
                            _formKey.currentState!.fields['name']!.value,
                            _formKey.currentState!.fields['email']!.value,
                            _formKey.currentState!.fields['password']!.value);
                      }
                    },
                    child: const CustomButton(
                      text: 'Sign Up',
                    ),
                  ),
                ),
                Space.y1!,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account ? "),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return const LoginScreen();
                            }),
                          ),
                        );
                      },
                      child: Text(
                        'Login Now',
                        style: AppText.h3b!
                            .copyWith(color: Colors.deepPurple, fontSize: 15),
                      ),
                    ),
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
