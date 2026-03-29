import 'package:isar/isar.dart';
import 'package:movie_app/models/domain/movies.dart';
import 'package:movie_app/models/genres.dart';
import 'package:movie_app/models/movie_detail.dart';
import 'package:movie_app/models/notification.dart';
import 'package:movie_app/shared/local/cache/local_db.dart';
import 'package:path_provider/path_provider.dart';

class InitDbImpl extends LocalDb {
  late Isar db;

  @override
  Future<void> initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      MoviesSchema,
      GenresSchema,
      MovieDetailSchema,
      NotificationModelSchema,
    ], directory: dir.path);
  }

  @override
  Isar getDb() {
    return db;
  }

  @override
  Future<void> cleanDb() async {
    await db.writeTxn(() => cleanDb());
  }
}
