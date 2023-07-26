import 'package:injectable/injectable.dart';

import '../../../application/logger/i_logger.dart';
import '../../../entities/category.dart';
import '../data/i_categories_repository.dart';
import 'i_categories_service.dart';

@LazySingleton(as: ICategoriesService)
class CategoriesService implements ICategoriesService {
  ICategoriesRepository categoriesRepository;
  ILogger log;

  CategoriesService({
    required this.categoriesRepository,
    required this.log,
  });

  @override
  Future<List<Category>> findAll() => categoriesRepository.findAll();
}
