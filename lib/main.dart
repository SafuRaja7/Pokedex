import 'package:dexplatassesment/approutes.dart';
import 'package:dexplatassesment/cubits/auth/auth_cubit.dart';
import 'package:dexplatassesment/cubits/favourites/favourites_cubit.dart';
import 'package:dexplatassesment/cubits/pokemon/pokemon_cubit.dart';
import 'package:dexplatassesment/model/pokemon.dart';
import 'package:dexplatassesment/screens/home/home_screen.dart';
import 'package:dexplatassesment/screens/login_screen/login_screen.dart';
import 'package:dexplatassesment/screens/signup_screen/signup_screen.dart';
import 'package:dexplatassesment/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();

  Hive.registerAdapter(PokemonModelAdapter());

  await Hive.openBox('pokemon');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: ((context) => PokemonCubit())),
        BlocProvider(create: ((context) => FavouritesCubit())),
        BlocProvider(create: ((context) => AuthCubit())),
      ],
      child: MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.login,
        routes: {
          AppRoutes.splash: (context) => const Splash(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.signup: (context) => const SignupScreen(),
          AppRoutes.home: (context) => const HomeScreen()
        },
      ),
    );
  }
}
