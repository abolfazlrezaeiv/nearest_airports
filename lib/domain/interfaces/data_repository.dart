abstract class DateRepository<T> {
  Future<List<T>> getAll();
  T getById();
}
