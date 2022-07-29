import 'package:dexplatassesment/cubits/favourites/favourites_cubit.dart';
import 'package:dexplatassesment/screens/home/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  void initState() {
    final favCubit = BlocProvider.of<FavouritesCubit>(context);
    favCubit.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favCubit = BlocProvider.of<FavouritesCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: SafeArea(
        child: BlocBuilder(
          builder: ((context, state) {
            if (state is FavouriteFetchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FavouriteFetchSuccess && state.data!.isEmpty) {
              return const Center(
                child: Text('No Favourite items'),
              );
            } else if (state is FavouriteFetchSuccess) {
              return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.black,
                      ),
                  itemCount: favCubit.state.data!.length,
                  itemBuilder: (context, index) {
                    final pokemon = favCubit.state.data![index];
                    return PokemonCard(
                      pokemon: pokemon,
                    );
                  });
            }
            return const Center(
              child: Text('Something Went Wrong...!'),
            );
          }),
        ),
      ),
    );
  }
}
