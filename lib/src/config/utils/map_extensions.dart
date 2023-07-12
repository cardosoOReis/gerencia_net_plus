/// Extensions to help with [Map]
extension MapExtensions<K, V> on Map<K, V?> {
  /// Add a value to the map if [value] is not null.
  ///
  /// This method exists to help with cascading expressions.
  ///
  /// Example:
  ///
  /// ```dart
  ///final map = <String, dynamic>{}
  ///    ..addIfNotNull('key', 'value') // Will add.
  ///    ..addIfNotNull('nullValue', null); // Won't add.
  /// ```
  ///
  void addIfNotNull(K key, V? value) {
    if (value != null) {
      addAll({key: value});
    }
  }
}
