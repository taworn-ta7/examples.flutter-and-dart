typedef LessType<T> = bool Function(T a, T b);

void quickSort<T>(List<T> list, LessType<T> less) {
  print('$list; start');
  _quickSort(list, less, 0, list.length - 1);
  print('$list; finish');
}

void _quickSort<T>(
  List<T> list,
  LessType<T> less,
  int low,
  int high,
) {
  if (low < high) {
    // assign pivot as mid in list
    final index = (low + high) ~/ 2;
    final pivot = list[index];
    print('$list; range [$low, $high], pivot [$index] $pivot');

    // loop
    var left = low;
    var right = high;
    while (left <= right) {
      while (less(list[left], pivot)) {
        left++;
      }
      while (less(pivot, list[right])) {
        right--;
      }
      if (left <= right) {
        _swap(list, left, right);
        print('$list; after swap [$left, $right]');
        left++;
        right--;
      }
    }

    // recursive sort left part
    _quickSort(list, less, low, right);

    // recursive sort right part
    _quickSort(list, less, left, high);
  }
}

void _swap<T>(List<T> list, int i, int j) {
  final temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
