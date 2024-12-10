import 'package:flutter/material.dart';
import 'package:yonagi_native/services/jmdict_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dictionaryService = JMDictService();
  await dictionaryService.initialize();

  // Example search and fetch details
  const word = "言葉";
  final results = await dictionaryService.search(word);
  if (results != null && results.isNotEmpty) {
    print("Search Results:");
    for (var result in results) {
      print(result.kanjiElements!.first.element);
    }

  } else {
    print("No search results found.");
  }

  runApp(MyApp(dictionaryService: dictionaryService));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required dictionaryService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Welcome to My App!'),
      ),
    );
  }
}