// //For implementing gettign words by id

// //Add this to seeker.dart in jm_dict library
// JMDictEntryImpl? getById({required int id, required Store store}) {
//   final box = store.box<JMDictEntryImpl>();
//   final query = box.get(id);
//   return query;
// }

// //Add this to jm_dict.dart in jm_dict library
// JMDictEntry? getById(int id) {
//   if (!_checkInit()) {
//     return null;
//   }

//   final entryImpl = _seeker.getById(id: id, store: _store);

//   if (entryImpl == null) {
//     JMDictLogUtils.log("Entry with ID $id not found in JMDict.");
//     return null;
//   }

//   return entryImpl;
// }
