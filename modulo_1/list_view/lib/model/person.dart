import 'package:flutter/material.dart';

class Person {
  final String id;
  final String name;

  Person({required this.id, required this.name});

  factory Person.newPerson({required String name}) {
    String uuId = UniqueKey().toString();
    return Person(id: uuId, name: name);
  }
}
