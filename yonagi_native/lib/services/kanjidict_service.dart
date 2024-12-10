import 'package:kanji_dictionary/kanji_dictionary.dart';

class KanjiDictionaryService {
  late final KanjiDictionary _kanjiDictionary;

  /// Initialize the Kanji dictionary
  Future<void> initialize() async {
    try {
      _kanjiDictionary = await KanjiDictionary.instance;
      print("Kanji Dictionary initialized successfully.");
    } catch (e) {
      print("Error initializing Kanji Dictionary: $e");
    }
  }

  /// Get details for a specific Kanji character
  Character? getCharacter(String kanji) {
    try {
      return _kanjiDictionary.get(kanji);
    } catch (e) {
      print("Error fetching Kanji details: $e");
      return null;
    }
  }

  /// Get the easiest N Kanji characters
  List<Character> getEasiestKanji(int count) {
    try {
      return _kanjiDictionary.charactersByDifficulty.take(count).toList();
    } catch (e) {
      print("Error fetching easiest Kanji: $e");
      return [];
    }
  }
}
