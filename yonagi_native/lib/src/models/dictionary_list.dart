import 'package:jm_dict/jm_dict.dart';
import 'package:kanji_dictionary/kanji_dictionary.dart';

class DictionaryList {
  DictionaryList({
    required this.id,
    this.premade = false,
    this.title = "",
    this.description = "",
    this.wordIds = const [],
    this.kanjis = const [],
    this.words = const [],
    this.kanjiEntries = const [],
  });

  int id;
  bool premade = false;
  String title;
  String description;
  List<int> wordIds;
  List<String> kanjis;
  List<JMDictEntry> words;
  List<Character> kanjiEntries;
}
