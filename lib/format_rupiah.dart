import 'package:intl/intl.dart';

String formatRupiah(num angka) {
  final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
  return formatter.format(angka * 15000);
}
