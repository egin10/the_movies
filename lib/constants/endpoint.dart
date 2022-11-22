class Endpoint {
  static const apiKey = '729f5e603e62b68ae32b632cd98b6ac0';

  // Movies
  static const getDetailMovie = 'movie/%ID%?api_key=$apiKey';
  static const getTopRatedMovie = 'movie/top_rated?api_key=$apiKey';
  static const getUpcomingMovie = 'movie/upcoming?api_key=$apiKey';
  static const getNowPlayingMovie = 'movie/now_playing?api_key=$apiKey';
  static const getPopularMovie = 'movie/popular?api_key=$apiKey';

  // TV
  static const getDetailTv = 'tv/%ID%?api_key=$apiKey';
  static const getTopRatedTv = 'tv/top_rated?api_key=$apiKey';
  static const getUpcomingTv = 'tv/upcoming?api_key=$apiKey';
  static const getNowPlayingTv = 'tv/now_playing?api_key=$apiKey';
  static const getPopularTv = 'tv/popular?api_key=$apiKey';

  // Person
  static const getDetailPerson = 'person/%ID%?api_key=$apiKey';
  static const getPopularPerson = 'person/popular?api_key=$apiKey';

  // Image Uri
  static const imageW500Uri = 'https://image.tmdb.org/t/p/w500';
  static const imageOriginUri = 'https://image.tmdb.org/t/p/original';
}
