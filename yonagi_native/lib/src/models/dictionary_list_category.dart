import 'package:yonagi_native/src/models/dictionary_list.dart';

class DictionaryListCategory {
  DictionaryListCategory(
      {required this.id, this.name = "", this.lists = const [], this.lastUsed});

  int id;
  String name;
  List<DictionaryList> lists;
  DateTime? lastUsed;
}
