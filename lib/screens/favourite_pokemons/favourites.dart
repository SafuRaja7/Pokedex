import 'package:dexplatassesment/configs/configs.dart';
import 'package:dexplatassesment/cubits/favourites/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../configs/app.dart';
import '../home/widgets/pokemon_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  void initState() {
    final pokemonCubit = BlocProvider.of<FavouritesCubit>(context);
    if (pokemonCubit.state.data == null) {
      pokemonCubit.fetch();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final favCubit = BlocProvider.of<FavouritesCubit>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
          centerTitle: true,
        ),
        body: BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: ((context, state) {
            if (state is FavouriteFetchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FavouriteFetchFailure) {
              return const Center(
                child: Text('OOPS Something Went Wrong...!'),
              );
            } else if (state is FavouriteFetchSuccess && state.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.no_adult_content_sharp,
                      size: AppDimensions.normalize(30),
                    ),
                    Space.y2!,
                    Text(
                      'Nothing to show',
                      style: AppText.h3b,
                    ),
                  ],
                ),
              );
            } else if (state is FavouriteFetchSuccess) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    final favourites = favCubit.state.data![index];
                    return PokemonCard(
                      pokemon: favourites,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.black,
                    );
                  },
                  itemCount: favCubit.state.data!.length);
            } else {
              return const Center(
                child: Text('Something Went Wrong...!'),
              );
            }
          }),
        ),
      ),
    );
  }
}
