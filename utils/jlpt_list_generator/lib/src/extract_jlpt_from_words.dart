import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';

Future<void> extractJLPTFromWords(
    List<String> csvPaths, String outputJsonPath) async {
  // Read the existing JSON file (if it exists)
  final outputFile = File(outputJsonPath);
  Map<String, dynamic> data = {
    'N1': {'wordIds': []},
    'N2': {'wordIds': []},
    'N3': {'wordIds': []},
    'N4': {'wordIds': []},
    'N5': {'wordIds': []},
  };

  if (outputFile.existsSync()) {
    final existingContent = await outputFile.readAsString();
    data = jsonDecode(existingContent);
  }

  // Process each CSV file
  for (var i = 0; i < csvPaths.length; i++) {
    final csvFile = File(csvPaths[i]);
    if (!csvFile.existsSync()) {
      print('CSV file does not exist: ${csvPaths[i]}');
      continue;
    }

    final csvContent = await csvFile.readAsString();
    final rows = CsvToListConverter().convert(csvContent, eol: "\n");

    // Determine the JLPT level based on file index (1-based)
    final jlptLevel = 'N${i + 1}';

    for (var row in rows.skip(1)) {
      // Skip header row
      final jmdictSeq = row[0].toString();

      // Append wordIds if not already present
      if (!data[jlptLevel]['wordIds'].contains(jmdictSeq)) {
        data[jlptLevel]['wordIds'].add(jmdictSeq);
      }
    }
  }

  // Write updated data back to JSON
  await outputFile.writeAsString(jsonEncode(data));
  print('JLPT word IDs updated: ${outputFile.absolute.path}');
}

