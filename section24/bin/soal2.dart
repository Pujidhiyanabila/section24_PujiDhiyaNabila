import 'package:dio/dio.dart';

void main(){
  Dio()
    .post(
      "http://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
      data: ({'id': 4, 'name': "Nabila", 'phone': 082171007526})
    )
    .then((response){
      Data.fromjson(response.data);
      print(response);    
  });
}

class Data {
  int? id;
  String? name;
  int? phone;

  Data(this.id, this.name, this.phone);
  Data.fromjson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> tojson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}