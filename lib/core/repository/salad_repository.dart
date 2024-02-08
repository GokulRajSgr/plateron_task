import 'package:plateron_task/core/models/salad.dart';

abstract class SaladRepository {
  Future<List<Salad>> getSalads();
}
