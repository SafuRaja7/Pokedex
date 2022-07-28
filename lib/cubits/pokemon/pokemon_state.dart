part of 'pokemon_cubit.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonLoading extends PokemonState {}

class PokemonSuccess extends PokemonState {}

class PokemonFailure extends PokemonState {}
