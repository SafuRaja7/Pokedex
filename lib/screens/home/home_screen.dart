import 'package:dexplatassesment/cubits/pokemon/pokemon_cubit.dart';
import 'package:dexplatassesment/screens/home/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final pokemonCubit = BlocProvider.of<PokemonCubit>(context);
    if (pokemonCubit.state.data == null) {
      pokemonCubit.fetchapi();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: ((context, state) {
            if (state is PokemonLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PokemonFailure) {
              return const Center(
                child: Text('Something went Wrong...!'),
              );
            } else if (state is PokemonSuccess) {
              return ListView(
                  children: state.data!
                      .map((pokemon) => PokemonCard(
                            pokemon: pokemon,
                          ))
                      .toList());
            } else {
              return const Text('Try Again');
            }
          }),
        ),
      ),
    );
  }
}
