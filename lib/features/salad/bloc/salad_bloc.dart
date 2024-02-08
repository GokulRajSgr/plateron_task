import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:plateron_task/core/models/salad.dart';
import 'package:plateron_task/core/repository/salad_repository.dart';
import 'package:plateron_task/features/salad/bloc/salad_event.dart';
import 'package:plateron_task/features/salad/bloc/salad_state.dart';

class SaladBloc extends Bloc<SaladEvent, SaladState> {
  final SaladRepository repository;
  List<Salad>? salads;
  int totalItems = 0;

  SaladBloc({required this.repository}) : super(SaladInitial());

  List<Salad> get saladsInCart {
    final currentState = state;
    if (currentState is SaladLoadSuccess) {
      return currentState.salads
          .where((salad) => salad.selectedItems > 0)
          .toList();
    } else {
      return [];
    }
  }

  updateTotalCart() {
    totalItems = saladsInCart.fold(
        0, (previousValue, salad) => previousValue + salad.selectedItems);
  }

  @override
  Stream<SaladState> mapEventToState(
    SaladEvent event,
  ) async* {
    if (event is LoadSalads) {
      yield* _mapLoadSaladsToState();
    } else if (event is AddToCart) {
      yield* _mapAddToCartToState(event.salad);
    } else if (event is RemoveFromCart) {
      yield* _mapRemoveFromCartToState(event.salad);
    }
  }

  Stream<SaladState> _mapLoadSaladsToState() async* {
    yield SaladLoadInProgress();
    try {
      salads = await repository.getSalads();
      yield SaladLoadSuccess(salads: salads!);
    } catch (e) {
      yield SaladLoadFailure(error: e.toString());
    }
  }

  Stream<SaladState> _mapAddToCartToState(Salad salad) async* {
    updateTotalCart();
    yield SaladLoadSuccess(salads: salads!, totalItems: totalItems);
  }

  Stream<SaladState> _mapRemoveFromCartToState(Salad salad) async* {
    updateTotalCart();
    yield SaladLoadSuccess(salads: salads!, totalItems: totalItems);
  }
}
