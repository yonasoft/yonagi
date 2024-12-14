import 'package:jlpt_list_generator/src/extract_jlpt_from_words.dart';
import 'package:jlpt_list_generator/src/extract_jlpt_from_kanji.dart';

Future<void> main() async {
  try {

    const outputFilePath = 'lib/output/jlpt_lists.json';
    const csvPaths = [
      'lib/assets/data/n1.csv',
      'lib/assets/data/n2.csv',
      'lib/assets/data/n3.csv',
      'lib/assets/data/n4.csv',
      'lib/assets/data/n5.csv'
    ];
    extractJLPTFromKanji(outputFilePath).then((value) async =>
        await extractJLPTFromWords(csvPaths, outputFilePath));
  } catch (e) {
    print('Error: $e');
  }
}
