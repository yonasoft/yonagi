import 'package:kanji_dictionary/kanji_dictionary.dart';

class KanjiDictService {
  late final KanjiDictionary _kanjiDictionary;

  Future<void> initialize() async {
    try {
      _kanjiDictionary = await KanjiDictionary.instance;
      print("Kanji Dictionary initialized successfully.");
    } catch (e) {
      print("Error initializing Kanji Dictionary: $e");
    }
  }

  Future<Character?> getCharacter(String kanji) async {
    try {
      return _kanjiDictionary.get(kanji);
    } catch (e) {
      print("Error fetching Kanji details: $e");
      return null;
    }
  }

  Future<List<Character?>> getAllCharacters(List<String> kanjis) async {
    try {
      return kanjis.map((final kanji) => _kanjiDictionary.get(kanji)).toList();
    } catch (e) {
      print("Error fetching Kanji details: $e");
      return [];
    }
  }

  Future<List<Character?>> getKanjisFromWord(String word) async {
    try {
      return word
          .split('')
          .map((final kanji) => _kanjiDictionary.get(kanji))
          .where((final char) => char != null)
          .toList();
    } catch (e) {
      print("Error fetching Kanji details: $e");
      return [];
    }
  }
}
