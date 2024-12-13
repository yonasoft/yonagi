import 'dart:convert';
import 'dart:io';
import 'package:kanji_dictionary/kanji_dictionary.dart';

Future<void> extractJLPTFromKanji(String filePath) async {
  final kanjiDictionary = await KanjiDictionary.instance;

  final file = File(filePath);
  final outputDir = file.parent;
  if (!outputDir.existsSync()) {
    outputDir.createSync(recursive: true);
  }

  final data = {};

  for (final char in kanjiDictionary.characters) {
    final Difficulty difficulty = char.difficulty;
    if (difficulty.jlpt != null) {
      final key = (difficulty.jlpt! < 4) ? 'N${difficulty.jlpt!}' : 'N4/N5}';
      if (!data.containsKey(key)) {
        data[key] = {
          'kanjis': [],
          'wordIds': [],
        };
      }
      data[key]!['kanjis']?.add(char.literal);
    }
  }

  final jsonString = jsonEncode(data);
  await file.writeAsString(jsonString);

  print('JSON file created: ${file.absolute.path}');
}
