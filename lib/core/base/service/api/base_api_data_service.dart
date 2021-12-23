abstract class BaseAPIDataService<T> {
  Future<List<T>> fetchAll();
  Future<T> add(T data);
  Future<T> update(String id, T newData);
  Future<bool> delete(String id);
}
