import 'package:bloc/bloc.dart';
import 'package:dexplatassesment/model/pokemon.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favourites_state.dart';
part 'data_provider.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesDefault());

  Future<void> fetch() async {
    emit(const FavouriteFetchLoading());

    try {
      List<PokemonModel?>? data = await FavouritesDataProvider.fetch();

      emit(FavouriteFetchSuccess(data: data, isfav: false));
    } catch (e) {
      emit(FavouriteFetchFailure(message: e.toString()));
    }
  }

  Future<void> updateFav(PokemonModel pokemon, bool add) async {
    emit(const FavouriteFetchLoading());
    try {
      List<PokemonModel?>? data = [];
      if (add) {
        data = await FavouritesDataProvider.addfav(pokemon);
      } else {
        data = await FavouritesDataProvider.removefav(pokemon);
      }
      emit(
        FavouriteFetchSuccess(data: data, isfav: add),
      );
    } catch (e) {
      emit(FavouriteFetchFailure(message: e.toString()));
    }
  }

  Future<void> checkBookmarked(PokemonModel pokemon) async {
    emit(const FavouriteFetchLoading());
    try {
      final isfav = await FavouritesDataProvider.checkfav(pokemon);
      final data = await FavouritesDataProvider.fetch();
      emit(
        FavouriteFetchSuccess(
          data: data,
          isfav: isfav ?? false,
        ),
      );
    } catch (e) {
      emit(FavouriteFetchFailure(message: e.toString()));
    }
  }
}
