import 'package:plateron_task/core/models/salad.dart';

abstract class SaladState {}

class SaladInitial extends SaladState {}

class SaladLoadInProgress extends SaladState {}

class SaladLoadSuccess extends SaladState {
  final List<Salad> salads;
  int? totalItems=0;

  SaladLoadSuccess({required this.salads, this.totalItems});
}

class SaladLoadFailure extends SaladState {
  final String error;

  SaladLoadFailure({required this.error});
}
