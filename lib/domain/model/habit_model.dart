import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'habit_model.g.dart';


@JsonSerializable()
@HiveType(typeId: 0)
class Habit {
  @HiveField(0)
  String? habitName;
  @HiveField(1)
  String? habitDesc;
  @HiveField(2)
  String? habitID;

  Habit({
    this.habitName,
    this.habitDesc,
    this.habitID,
  });
}
