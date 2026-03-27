class EndPoints {
  static const String nowShowing = 'movie/now_playing';
  static const String popular = 'movie/top_rated';
  static const String genre = 'genre/movie/list';

  // ignore: strict_top_level_inference
  static String movie(id) => 'movie/$id';

  static String casts(int id) => '/movie/$id/credits';
  static String videos(int id) => '/movie/$id/videos';
}

class Params {
  static const String page = 'page';
  static const String apiKey = 'api_key';
}
