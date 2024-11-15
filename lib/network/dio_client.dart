
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DioClinet {
  final Dio _dio = Dio();
  DioClinet();

  Future<Response> get(String url) async {
    try {
      return await _dio.get(url);
    } catch (e) {
      throw Exception(e);
    }
  }
}

final dioProvider=Provider<DioClinet>((ref)=>DioClinet());