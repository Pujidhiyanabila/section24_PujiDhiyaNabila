import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/model/model_contact.dart';

class ApiService {
  final _dio = Dio();
  Future<List<ModelContact>> getContact() async {
    try {
      final response = await _dio.get(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
      );
      // print('Line12: ${response.data}');
      final result = response.data as List;
      print('Line15: $result');
      return result.map<ModelContact>((e) {
        return ModelContact.fromJson(e);
      }).toList();
      // final List<ModelContact> nama = result;
      // final listContact = ModelContact.fromJson(response.data);
      // print('Line 17: $listContact');
    } catch (exceptions) {
      print('Line 18: $exceptions');
    }

    // final result = ModelContact.fromJson(response.data);
    return [];
  }
}
