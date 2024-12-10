import 'package:jm_dict/jm_dict.dart';

class JMDictService {
  final JMDict _searchDictionary = JMDict();

  /// Initialize both `jm_dict` and `jm_dict_en`
  Future<void> initialize() async {
    try {
      await _searchDictionary.initFromAsset(assetPath: "assets/JMdict.gz");
      print("JMDict search initialized successfully.");

    } catch (e) {
      print("Error initializing JMDictService: $e");
    }
  }

  /// Search using `jm_dict`
  Future<List<JMDictEntry>?> search(String keyword,
      {int? limit, int? offset}) async {
    try {
      return _searchDictionary.search(
          keyword: keyword, limit: limit, offset: offset);
    } catch (e) {
      print("Error searching JMDict: $e");
      return [];
    }
  }
}
