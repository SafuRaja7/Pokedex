// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dexplatassesment/cubits/favourites/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dexplatassesment/configs/configs.dart';
import 'package:dexplatassesment/model/pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonCard extends StatefulWidget {
  final PokemonModel? pokemon;
  const PokemonCard({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  void initState() {
    final favCubit = BlocProvider.of<FavouritesCubit>(context);

    if (widget.pokemon != null) {
      favCubit.checkFav(widget.pokemon!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favCubit = BlocProvider.of<FavouritesCubit>(context);
    String caps(String s) => s[0].toUpperCase() + s.substring(1);

    return Card(
      borderOnForeground: false,
      child: Container(
        padding: Space.all(0.5, 0),
        width: double.infinity,
        height: AppDimensions.normalize(35),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Space.y!,
            Text(
              caps(widget.pokemon!.name),
              style: AppText.h2b,
            ),
            Space.y!,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: ((context, state) {
                    return InkWell(
                      onTap: () {
                        if (favCubit.state.isfav!) {
                          favCubit.updateFav(widget.pokemon!, false);
                        } else {
                          favCubit.updateFav(widget.pokemon!, true);
                        }
                      },
                      child: favCubit.state.isfav!
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    );
                  }),
                ),
              ],
            ),
            Text(
              widget.pokemon!.url,
            ),
          ],
        ),
      ),
    );
  }
}
