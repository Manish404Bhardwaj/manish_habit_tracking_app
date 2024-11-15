import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manish_habit_tracking_app/data/repository.dart';
import 'package:manish_habit_tracking_app/domain/model/quote.dart';

final quoteFutureProvidr = FutureProvider<List<Quote>>((ref) async {
  return await ref.watch(qouteRepoProvider).getAllQuotes();
});
