import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/model_contact.dart';
import 'package:flutter_application_1/service/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rest Api')),
      body: FutureBuilder<List<ModelContact>>(
        //  menampilkan loading
          future: ApiService().getContact(),
          builder: (context, AsyncSnapshot<List<ModelContact>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              if (snapshot.hasData) {
                final returnData = snapshot.data;
                print(returnData);
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('nama ${returnData?[index].name}'),
                      subtitle: Text('phone ${returnData?[index].phone}'),
                    );
                  },
                  itemCount: returnData!.length,
                );
              }
            }
            return Text('');
          }),
    );
  }
}
