import 'package:uuid/uuid.dart';

class Person {
  final String id;
  final String name;

  Person({required this.id, required this.name});

  factory Person.newPerson({required String name}) {
    Uuid uuid = const Uuid();
    String uuId = uuid.v8();
    return Person(id: uuId, name: name);
  }
}
