import 'package:intl/intl.dart';

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat('d MMMM yyyy', 'ar').format(date);

  return formattedDate;
}
