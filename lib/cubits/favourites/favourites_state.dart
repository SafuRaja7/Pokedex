part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  final List<PokemonModel>? data;
  final bool? isfav;
  final String? message;

  const FavouritesState({
    this.data,
    this.message,
    this.isfav = false,
  });

  @override
  List<Object?> get props => [
        data,
        message,
        isfav,
      ];
}

class FavouritesDefault extends FavouritesState {}

class FavouriteFetchLoading extends FavouritesState {
  const FavouriteFetchLoading() : super();
}

class FavouriteFetchSuccess extends FavouritesState {
  const FavouriteFetchSuccess({List<PokemonModel>? data, bool? isfav})
      : super(
          data: data,
          isfav: isfav,
        );
}

class FavouriteFetchFailure extends FavouritesState {
  const FavouriteFetchFailure({String? message}) : super(message: message);
}
