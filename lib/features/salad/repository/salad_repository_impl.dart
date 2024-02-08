// lib/features/salad/repository/salad_repository_impl.dart
import 'package:plateron_task/core/models/salad.dart';
import 'package:plateron_task/core/repository/salad_repository.dart';

class SaladRepositoryImpl implements SaladRepository {
  @override
  Future<List<Salad>> getSalads() async {
    // Implement fetching salads from an API or database
    // For now, returning a dummy list
    return Future.delayed(const Duration(seconds: 1), () {
      return [
        Salad(
          dishName: 'The Mixed Green Salad',
          description: 'Fresh cut hearts of romaine',
          price: 14.50,
          imagePath: 'assets/salad1.png',
        ),
        Salad(
          dishName: 'Caesar Salad',
          description: 'Crisp romaine lettuce with Caesar dressing',
          price: 12.99,
          imagePath: 'assets/salad2.png',
        ),
      ];
    });
  }
}
