import '../models/spoken_language.dart';

String getOriginalLanguage(List<SpokenLanguage> list, String original) => list
    .map((spoken) {
      if (spoken.iso6391 == original) {
        return '${spoken.englishName} | ${spoken.name}';
      }
    })
    .toString()
    .replaceAll('null', '')
    .replaceAll(',', '')
    .replaceAll(' ', '');
