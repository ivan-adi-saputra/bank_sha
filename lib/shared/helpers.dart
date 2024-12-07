import 'package:intl/intl.dart';

String formatCurrency(int number) {
  return NumberFormat('#,##0').format(number);
}
