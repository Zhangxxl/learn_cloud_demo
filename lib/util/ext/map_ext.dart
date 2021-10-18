/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// project  : yicbridge_aj_app
/// package  :
/// author   : zhang
/// date     : 2021/10/12 0010
/// email    : zhangxx@yunjiacloud.com
extension MapExt<K, V> on Map<K, V>? {
  MapEntry<K, V>? findFirst(bool Function(K k, V v) condition) {
    if (this == null) {
      return null;
    }
    final Iterable<K> localKeys = this!.keys;
    for (final K key in localKeys) {
      final V value = this![key] as V;
      if (condition(key, value)) {
        return MapEntry(key, value);
      }
    }
    return null;
  }

  Map<K, V> find(bool Function(K k, V v) condition) {
    final Map<K, V> map = {};
    if (this == null) {
      return map;
    }
    final Iterable<K> localKeys = this!.keys;
    for (final K key in localKeys) {
      final V value = this![key] as V;
      if (condition(key, value)) {
        map[key] = value;
      }
    }
    return map;
  }
}
