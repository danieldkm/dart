import '../../../entities/category.dart';

abstract class ICategoriesService {
  Future<List<Category>> findAll();
}
