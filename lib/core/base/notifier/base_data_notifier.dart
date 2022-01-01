import 'package:flutter/material.dart';

abstract class BaseDataNotifier<T> with ChangeNotifier {
  Future<List<T>> getAll();
  Future<T> add(T data);
  Future<T> update(String id, T data);
  Future<bool> delete(String id);
}
