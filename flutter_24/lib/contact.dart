import 'dart:convert';

class Contact {
  late int id;
  late String name;
  late String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  Contact.fromJson(Map<String, dynamic> contact){
    id = contact['id'];
    name = contact['name'];
    phone = contact['phone'];
  }
}

List<Contact> parseContact(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Contact.fromJson(json)).toList();
}