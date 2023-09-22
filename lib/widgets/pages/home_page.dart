import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[50],
        title: const Text(
          '21 September',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              color: Colors.amberAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                side: BorderSide(color: Colors.black),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/greeting');
                        },
                        icon: const Icon(Icons.more_vert_outlined),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          'Sé que eres una persona especial\nque tienes muchos SUEÑOS y METAS.\n Por eso, el día de hoy\n',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/greeting');
                      },
                      icon: const Icon(
                        Icons.favorite,
                        size: 20,
                      ),
                      label: Text('Presionáme', style: Theme.of(context).textTheme.titleLarge),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
