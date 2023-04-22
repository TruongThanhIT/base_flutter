import 'package:floor/floor.dart';

class BaseEntity {
  @ColumnInfo(name: 'created_time')
  DateTime? createdTime;

  @ColumnInfo(name: 'updated_time')
  DateTime? updatedTime;

  BaseEntity({
    this.createdTime,
    this.updatedTime,
  }) {
    createdTime = createdTime ?? DateTime.now();
    updatedTime = updatedTime ?? DateTime.now();
  }
}
