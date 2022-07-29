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
    return Card(
      borderOnForeground: false,
      child: Container(
          padding: Space.all(0.5, 0),
          width: double.infinity,
          height: AppDimensions.normalize(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              // BoxShadow(
              //   color: Colors.black12,
              //   offset: Offset(0, 10),
              //   blurRadius: 20,
              //   spreadRadius: 1.0,
              // ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.y!,
              Text(
                pokemon!.name,
                style: AppText.h2b,
              ),
              Space.y1!,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  InkWell(
                    child: Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
