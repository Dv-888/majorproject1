//import 'dart:js';

import 'package:dio/dio.dart';
//import 'reads.dart';

class DataApi {
  final _dio = Dio(BaseOptions(baseUrl: 'http://localhost:6001/'));

  Future<List> getreadings() async {
    final response = await _dio.get('');
    return response.data['UserDB'] as List;
  }
}
