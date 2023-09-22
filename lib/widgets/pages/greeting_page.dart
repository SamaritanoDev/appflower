import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:appflower/widgets/sunflower_bouquet_widget.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Te deseo todo lo bonito',
                    textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.amber[900]),
                    speed: const Duration(milliseconds: 50),
                  ),
                  TyperAnimatedText(
                    'para lograr lo que quieres',
                    textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.amber[900]),
                    speed: const Duration(milliseconds: 50),
                  ),
                  TyperAnimatedText(
                    'lo que resta del año.',
                    textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.amber[900]),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
              ),
              const SunflowerBouquetWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
