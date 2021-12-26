import 'package:vonop/models/form/form.dart';

abstract class BaseDataNotifier<T> {
  Future<List<T>?> getAll();
  Future<Form> add(T data);
  Future<Form> update(String id, T data);
  Future<bool> delete(String id);
}
