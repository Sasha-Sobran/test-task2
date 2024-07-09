import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testik/api/request_sender.dart';
import 'package:testik/models/poet.dart';

part "data_state.dart";

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  Future<bool> setPoets() async {
    try {
      emit(DataLoading());

      var data = await RequestSender().getPoetsList();

      emit(DataLoaded(data));
      return true;
    } catch (e) {
      return false;
    }
  }

  void deletePoet(int id) {
    if (state is DataLoaded) {
      final currentState = state as DataLoaded;
      final updatedData =
          currentState.data.where((poet) => poet.id != id).toList();
      emit(DataLoaded(updatedData));
    }
  }

  void addPoet(String name) {
    if (state is DataLoaded) {
      final currentState = state as DataLoaded;
      final updatedData = currentState.data;

      int id = updatedData
              .reduce((current, next) => current.id > next.id ? current : next)
              .id +
          1;
      updatedData.add(Poet(
        name: name,
        id: id,
      ));

      emit(DataLoaded(updatedData));
    }
  }

  void sortDataBy(String field) {
    if (state is DataLoaded) {
      final currentState = state as DataLoaded;
      final updatedData = currentState.data;
      if (field == "name") {
        updatedData.sort((a, b) => a.name.compareTo(b.name));
      } else if (field == "id") {
        updatedData.sort((a, b) => a.id.compareTo(b.id));
      }

      emit(DataLoaded(updatedData));
    }
  }
}
