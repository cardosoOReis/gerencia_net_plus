extension AddIfNotNull<K, V> on Map<K, V?> {
  void addIfNotNull(K key, V? value) {
    if (value != null) {
      addAll({key: value});
    }
  }
}
