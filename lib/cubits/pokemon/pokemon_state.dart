part of 'pokemon_cubit.dart';

abstract class PokemonState extends Equatable {
  final List<PokemonModel>? data;
  final String? error;
  const PokemonState({
    this.data,
    this.error,
  });

  @override
  List<Object> get props => [error!, data!];
}

class PokemonLoading extends PokemonState {
  const PokemonLoading() : super();
}

class PokemonSuccess extends PokemonState {
  const PokemonSuccess(List<PokemonModel>? data) : super(data: data);
}

class PokemonFailure extends PokemonState {
  const PokemonFailure(String? message) : super(error: message);
}
