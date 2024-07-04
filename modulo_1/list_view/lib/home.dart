import 'package:flutter/material.dart';
import 'package:list_view/model/person.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Person> persons = [];
  final tfName = TextEditingController();
  final fnName = FocusNode();

  void addItem() {
    fnName.requestFocus();
    var name = tfName.text;
    if (name.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text('Nome inválido!'),
          actions: [
            ElevatedButton.icon(
              label: const Text('Ok'),
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      );
      return;
    }
    var person = Person.newPerson(name: name);
    setState(() {
      persons.add(person);
    });
    tfName.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curso de Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tfName,
                    focusNode: fnName,
                  ),
                ),
                IconButton(
                  onPressed: addItem,
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: (context, index) {
                var person = persons[index];
                return ListTile(
                  title: Text(person.name),
                  subtitle: Text(person.id),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
