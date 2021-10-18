/// Copyright © 2021 yunjia Ltd.
/// All rights reserved
///
/// project  : yicbridge_aj_app
/// package  :
/// author   : zhang
/// date     : 2021/7/6 0023
/// email    : zhangxx@yunjiacloud.com
extension ListExt<E> on List<E>? {
  bool isBlank() => this == null || this!.isEmpty;

  bool isNotBlank() => !isBlank();

  E? findFirst(bool Function(E e) condition) {
    if (this == null) {
      return null;
    }
    for (final E element in this!) {
      if (condition(element)) {
        return element;
      }
    }
    return null;
  }

  List<E>? find(bool Function(E e) condition) {
    final List<E> result = [];
    if (this == null) {
      return result;
    }
    for (final E element in this!) {
      if (condition(element)) {
        result.add(element);
      }
    }
    return result;
  }
}
