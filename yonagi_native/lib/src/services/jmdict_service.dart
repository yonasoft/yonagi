import 'package:jm_dict/jm_dict.dart';

class JMDictService {
  final JMDict _dictionary = JMDict();

  Future<void> initialize() async {
    try {
      await _dictionary.initFromAsset(assetPath: "assets/JMdict.gz");
      print("JMDict search initialized successfully.");
    } catch (e) {
      print("Error initializing JMDictService: $e");
      rethrow; // To ensure the caller knows initialization failed
    }
  }

  Future<List<JMDictEntry>?> search(String keyword,
      {int? limit, int? offset}) async {
    try {
      final result =
          _dictionary.search(keyword: keyword, limit: limit, offset: offset);
      return result;
    } catch (e) {
      print("Error searching JMDict: $e");
      return [];
    }
  }

  Future<JMDictEntry?> get(int id) async {
    try {
      return _dictionary.getById(id);
    } catch (e) {
      print("Error getting $id from JMDict: $e");
      return null;
    }
  }

  Future<List<JMDictEntry?>> getAll(List<int> ids) async {
    try {
      final result = await Future.wait(ids.map((id) async {
        return _dictionary.getById(id);
      }));
      return result.where((entry) => entry != null).toList();
    } catch (e) {
      print("Error getting all entries from JMDict: $e");
      return [];
    }
  }
}
