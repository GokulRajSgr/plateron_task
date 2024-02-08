import 'package:plateron_task/core/models/salad.dart';
import 'package:plateron_task/features/salad/repository/salad_repository_impl.dart';

class SaladDataProvider {
  final SaladRepositoryImpl _saladRepository = SaladRepositoryImpl();

  Future<List<Salad>> getSalads() async {
    return await _saladRepository.getSalads();
  }
}
