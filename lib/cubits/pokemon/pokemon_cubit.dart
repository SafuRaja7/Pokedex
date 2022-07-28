import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonLoading());
}
