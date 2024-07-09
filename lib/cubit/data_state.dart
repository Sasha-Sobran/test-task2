part of "data_cubit.dart";

abstract class DataState {}

final class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<Poet> data;

  DataLoaded(this.data);
}
