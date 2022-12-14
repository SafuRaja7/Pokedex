part of 'favourites_cubit.dart';

class FavouritesDataProvider {
  static final cache = Hive.box('pokemon');

  static Future<List<PokemonModel>?> fetch() async {
    try {
      List? favourites = await cache.get('pokemon');
      if (favourites == null) {
        favourites = <PokemonModel?>[];
        await cache.put('pokemon', favourites);
      }

      final List<PokemonModel> cachedFav = List.from(favourites);

      return cachedFav;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<PokemonModel>?> addfav(PokemonModel? pokemon) async {
    try {
      List? favourites = await cache.get('favourites');
      if (favourites == null) {
        favourites = <PokemonModel?>[];
        await cache.put('pokemon', favourites);
      }

      final List<PokemonModel> updatedfavourites = List.from(favourites);
      updatedfavourites.add(pokemon!);

      await cache.put('pokemon', updatedfavourites);
      return updatedfavourites;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<PokemonModel>?> removefav(PokemonModel? pokemon) async {
    try {
      List? favourites = await cache.get('pokemon');

      final List<PokemonModel> updatedfavourites = List.from(favourites!);
      updatedfavourites.remove(pokemon);

      await cache.put('pokemon', updatedfavourites);
      return updatedfavourites;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<bool?> checkfav(PokemonModel? pokemon) async {
    try {
      List? favourites = await cache.get('pokemon');

      final List<PokemonModel?> updatedfavourites = List.from(favourites!);
      return updatedfavourites.contains(pokemon);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
