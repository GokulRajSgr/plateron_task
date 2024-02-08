// lib/core/repository/salad_repository.dart
import '../models/salad.dart';

abstract class SaladRepository {
  Future<List<Salad>> getSalads();
}
