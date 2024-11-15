import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:manish_habit_tracking_app/domain/model/habit_model.dart';

class HiveRepo {
  final habitTable = 'habitTable';

  void registerAdaptor() {
    Hive.registerAdapter((HabitAdapter()));
  }

  Future addPokemonInTable(Habit habit) async {
    final habitBox = await Hive.openBox(habitTable);
    if (habitBox.isOpen) {
      await habitBox.put(habit.habitID, habit);
    } else {
      throw Exception("Error");
    }
  }

  Future deletePokemonFromTable(String id) async {
    final habitBox = await Hive.openBox(habitTable);
    if (habitBox.isOpen) {
      await habitBox.delete(id);
    } else {
      throw Exception("Error");
    }
  }

Future<List<Habit>> getAllAddedPokemon() async{
  final habitBox= await Hive.openBox<Habit>(habitTable);
if (habitBox.isOpen) {
      return habitBox.values.toList();
    } else {
      throw Exception("Error");
    }
}

}

final hiveRepoProvider = Provider<HiveRepo>((ref)=> HiveRepo());

