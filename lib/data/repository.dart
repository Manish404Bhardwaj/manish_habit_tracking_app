import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manish_habit_tracking_app/application/constant.dart';
import 'package:manish_habit_tracking_app/domain/model/quote.dart';
import 'package:manish_habit_tracking_app/network/dio_client.dart';

class Repository {
  final Ref ref;

  Repository(this.ref);

  Future<List<Quote>> getAllQuotes() async {
   
    final response = await ref.read(dioProvider).get(QUOTE_API_URL);
    return QuoteResponse.fromJson(json.decode(response.toString())).quotes;
    
   
  }
}

final qouteRepoProvider=Provider<Repository>((ref){
  return Repository(ref);
});