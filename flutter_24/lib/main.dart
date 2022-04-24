import 'package:flutter/material.dart';
import 'package:flutter_24/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ContactListPage.routeName,
      routes: {
        ContactListPage.routeName:(context) => ContactListPage()
      },
    );
  }
}

class ContactListPage extends StatelessWidget {
  static const routeName = '/contact_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: FutureBuilder<String>(
        future: 
          DefaultAssetBundle.of(context).loadString('assets/contact.json'),
        builder: (context, snapshot) {
          final List<Contact> contact = parseContact(snapshot.data);
          return ListView.builder(
            itemCount: contact.length,
            itemBuilder: (context, index) {
              return buildContact(context, contact[index]);
            },
          );
        },
      ),
    );
  }

  Widget buildContact(BuildContext context, Contact contact) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      onTap: () {},
    );
  }

}

