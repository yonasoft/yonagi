import 'package:flutter/material.dart';
import 'package:yonagi_native/src/services/jmdict_service.dart';
import 'package:yonagi_native/src/services/kanjidict_service.dart';
import 'package:yonagi_native/src/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dictionaryService = JMDictService();
  await dictionaryService.initialize();

  final kanjiDictionaryService = KanjiDictService();
  await kanjiDictionaryService.initialize();

  // Example search and fetch details
  // const word = "言葉";
  // final results = await dictionaryService.search(word);
  // if (results != null && results.isNotEmpty) {
  //   print("Search Results:");
  //   for (var result in results) {
  //     print(result.kanjiElements?.first.element);
  //   }
  // } else {
  //   print("No search results found.");
  // }

  // final character = kanjiDictionaryService.getCharacter('亜')?;
  // print(character.literal);
  // print(character.meanings[Language.english]);
  // print(character.readings[Reading.japaneseOn]);
  // print(character.readings[Reading.japaneseKun]);
  // print(character.difficulty.jlpt);
  runApp(const MyApp());
}
