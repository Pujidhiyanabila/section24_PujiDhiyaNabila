import 'package:dio/dio.dart';

void main(){
  Dio()
    .post(
      "http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
      data: ({'id': 4, 'name': "Nabila", 'phone': 082171007526})
    )
    .then((response){
      print(response);    
  });
}