abstract class BaseRepository<T> {
  Future<List<T>> getAll();
  T getById();
}
