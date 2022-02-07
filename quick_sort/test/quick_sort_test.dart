import 'package:test/test.dart';
import 'package:collection/collection.dart';
import 'package:quick_sort/quick_sort.dart';

void main() {
  test('quick sort test, min => max', () {
    List<int> data = [0, 1, 2, 3, 4, 5, 6, 7];
    List<int> test = [0, 1, 2, 3, 4, 5, 6, 7];
    quickSort<int>(test, (a, b) => a < b);
    final result = test.equals(data);
    expect(result, true);
  });

  test('quick sort test, max => min', () {
    List<int> data = [0, 1, 2, 3, 4, 5, 6, 7];
    List<int> test = [7, 6, 5, 4, 3, 2, 1, 0];
    quickSort<int>(test, (a, b) => a < b);
    final result = test.equals(data);
    expect(result, true);
  });

  test('quick sort test, random', () {
    List<int> data = [0, 1, 2, 3, 4, 5, 6, 7];
    List<int> test = [5, 0, 7, 3, 4, 6, 2, 1];
    quickSort<int>(test, (a, b) => a < b);
    final result = test.equals(data);
    expect(result, true);
  });
}
