part of 'pokemon_cubit.dart';

class PokemonRepo {
  Future<List<PokemonModel>> fetchapi() => PokemonDataProvider.fetchapi();
}
