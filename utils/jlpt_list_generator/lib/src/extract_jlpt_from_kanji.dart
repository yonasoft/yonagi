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

  // Initialize an empty data map
  final data = {
    'N1': {'kanjis': [], 'wordIds': []},
    'N2': {'kanjis': [], 'wordIds': []},
    'N3': {'kanjis': [], 'wordIds': []},
    'N4': {'kanjis': [], 'wordIds': []},
    'N5': {'kanjis': [], 'wordIds': []},
  };

  for (final char in kanjiDictionary.characters) {
    final Difficulty difficulty = char.difficulty;

    if (difficulty.jlpt != null) {
      final jlptLevel = difficulty.jlpt!;
      final kanji = char.literal;

      // Add kanji to the appropriate level
      if (jlptLevel == 4) {
        // Add to both N4 and N5
        if (!data['N4']!['kanjis']!.contains(kanji)) {
          data['N4']!['kanjis']!.add(kanji);
        }
        if (!data['N5']!['kanjis']!.contains(kanji)) {
          data['N5']!['kanjis']!.add(kanji);
        }
      } else {
        final key = 'N$jlptLevel';
        if (!data[key]!['kanjis']!.contains(kanji)) {
          data[key]!['kanjis']!.add(kanji);
        }
      }
    }
  }

  // Write the final JSON file
  final jsonString = jsonEncode(data);
  await file.writeAsString(jsonString);

  print('JSON file created: ${file.absolute.path}');
}
