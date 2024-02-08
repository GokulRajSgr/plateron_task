
import 'package:plateron_task/core/models/salad.dart';

abstract class SaladEvent {}

class LoadSalads extends SaladEvent {}

class AddToCart extends SaladEvent {
  final Salad salad;

  AddToCart(this.salad);
}

class RemoveFromCart extends SaladEvent {
  final Salad salad;

  RemoveFromCart(this.salad);
}
