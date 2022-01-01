extension MapExtension<T> on Map<String, T> {
  bool get isValuesNull {
    bool allValuesNull = true;
    for (var value in values) {
      if (value != null) {
        allValuesNull = false;
      } else {
        allValuesNull = true;
      }
    }
    return allValuesNull;
  }

  bool checkNull(String name) {
    return this[name] == null;
  }

  Map<String, T> copyWith(String key, T value) {
    Map<String, T> data = Map.from(this);
    data[key] = value;
    return data;
  }
}
