import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Teste();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Titulo'),
      ),
      body: const Home(),
    );
  }
}

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    void onTap() {
      print('Click');
      List<Widget> componnentsTree = [];
      var localContext = context;
      while (localContext.mounted) {
        componnentsTree.add(localContext.widget);
        var widgetName = localContext.widget.toString();
        print('widget: ${widgetName}');
        var ancestor = localContext.findAncestorWidgetOfExactType<Widget>();
        print('ancestor: ${ancestor.toString()}');

        if (widgetName == '[root]') {
          break;
        }

        localContext.visitAncestorElements(
          (element) {
            localContext = element;
            return true;
          },
        );
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 90,
        color: Colors.blueGrey,
      ),
    );
  }
}

class Shower extends StatelessWidget {
  const Shower({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 150,
            color: Colors.red,
          ),
          Container(
            height: 100,
            width: 150,
            color: Colors.green,
            child: const Center(
              child: Button(),
            ),
          ),
        ],
      ),
    );
  }
}

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Shower(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: Column(
          children: [
            const Text('Texto 1'),
            const Text('Texto 2'),
            Container(
              color: Colors.amber,
              child: Column(
                children: [
                  const Text('Texto Container'),
                  ElevatedButton(
                    onPressed: onPressed,
                    child: const Text('Mostrar Arvore'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
