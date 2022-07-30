import 'package:bloc/bloc.dart';
import 'package:dexplatassesment/model/pokemon.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'pokemon_state.dart';
part 'repository.dart';
part 'data_provider.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(const PokemonLoading());

  final repo = PokemonRepo();

  Future<void> fetchapi() async {
    emit(
      const PokemonLoading(),
    );

    try {
      var data = await repo.fetchHive();

      data ??= await repo.fetchapi();

      emit(
        PokemonSuccess(data),
      );
    } catch (e) {
      emit(
        PokemonFailure(
          e.toString(),
        ),
      );
    }
  }
}
