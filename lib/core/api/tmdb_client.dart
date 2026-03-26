import 'package:dio/dio.dart';
import 'base_client.dart';

class TMDBClient {
  final BaseClient _client;

  TMDBClient(this._client);

  /// 🎬 Trending Movies
  Future<Response> getTrendingMovies() {
    return _client.get('/trending/movie/day');
  }

  /// 🔍 Search Movies
  Future<Response> searchMovies(String query) {
    return _client.get(
      '/search/movie',
      query: {
        "query": query,
      },
    );
  }

  /// 🎥 Movie Details
  Future<Response> getMovieDetails(int movieId) {
    return _client.get('/movie/$movieId');
  }

  /// ⭐ Top Rated
  Future<Response> getTopRatedMovies() {
    return _client.get('/movie/top_rated');
  }

  /// 🎭 Upcoming
  Future<Response> getUpcomingMovies() {
    return _client.get('/movie/upcoming');
  }
}