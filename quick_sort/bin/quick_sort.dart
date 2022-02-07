import 'package:quick_sort/quick_sort.dart' as quick_sort;

void main(/*List<String> args*/) {
  List<int> a = [11, 88, 1, 9, 3, 7, -5, 3, 1, 0, 10];
  quick_sort.quickSort<int>(a, (a, b) => a < b);

  List<double> b = [1.1, 9.9, 3.3, 0.7, -5.55, 133, 1, 0, 10.01];
  quick_sort.quickSort<double>(b, (a, b) => a < b);

  List<String> c = ['Dee', 'eXe', 'Zzz Zzz Zzz', 'pod', 'EEEEE', 'Dee'];
  quick_sort.quickSort<String>(c, (a, b) => a.compareTo(b) < 0);
}
