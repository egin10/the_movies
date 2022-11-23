import '../models/movies/detail_movie_model.dart';

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
