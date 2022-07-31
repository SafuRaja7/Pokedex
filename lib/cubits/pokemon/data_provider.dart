part of 'pokemon_cubit.dart';

class PokemonDataProvider {
  static final dio = Dio();
  static final cache = Hive.box('pokemon');

  static Future<List<PokemonModel>> fetchapi() async {
    try {
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/');

      final Map raw = response.data;
      List? data = raw['results'];

      final List<PokemonModel> pokemon = List.generate(
        data!.length,
        (index) => PokemonModel.fromMap(data[index]),
      );

      await cache.put('pokemon', pokemon);

      return pokemon;
    } on DioError catch (e) {
      if (DioErrorType.other == e.type) {
        if (e.message.contains('SocketException')) {
          throw Exception('Poor internet connection. Please try again!');
        } else {
          throw Exception(e.message);
        }
      } else {
        throw Exception('Problem connecting to the server. Please try again.');
      }
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<PokemonModel>?> fetchHive() async {
    try {
      List? cachedPokemons = cache.get('pokemon');

      if (cachedPokemons == null) return null;

      List<PokemonModel>? pokemon = List.generate(
        cachedPokemons.length,
        (index) => cachedPokemons[index],
      );
      return pokemon;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
