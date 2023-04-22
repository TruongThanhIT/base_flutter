import 'package:base_app/data_source/local/entity/base_entity.dart';
import 'package:floor/floor.dart';

abstract class BaseDao<T extends BaseEntity> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertItem(T item);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertItems(List<T> items);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateItem(T item);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> updateItems(List<T> items);

  @delete
  Future<void> deleteItem(T item);

  @delete
  Future<int> deleteItems(List<T> items);
}
