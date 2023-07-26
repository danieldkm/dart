import '../../../entities/category.dart';

abstract class ICategoriesRepository {
  Future<List<Category>> findAll();
}
