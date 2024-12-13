import 'package:yonagi/src/models/dictionary_list.dart';

class DictionaryListCategory {
  DictionaryListCategory({
    required this.id,
    this.premade = false,
    this.name = "",
    this.lastUsed,
    this.listIds = const [],
    this.lists = const [],
  });

  int id;
  bool premade;
  String name;
  DateTime? lastUsed;
  List<int> listIds;
  List<DictionaryList> lists;
}
