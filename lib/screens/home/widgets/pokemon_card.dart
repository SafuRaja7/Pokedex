// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dexplatassesment/configs/configs.dart';
import 'package:dexplatassesment/model/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel? pokemon;
  const PokemonCard({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: AppDimensions.normalize(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(pokemon!.name),
            Space.y1!,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.favorite,
                ),
              ],
            ),
            Text(pokemon!.url),
          ],
        ));
  }
}
