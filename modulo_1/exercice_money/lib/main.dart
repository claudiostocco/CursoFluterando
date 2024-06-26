import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends Widget {
  const MyApp({super.key});

  @override
  Element createElement() {
    return AppElement(this);
  }
}

class AppElement extends ComponentElement {
  AppElement(super.widget);

  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
