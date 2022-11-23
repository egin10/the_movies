String convertDatetime(String dateTime) {
  final monthList = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final date = dateTime.split('-')[2];
  final month = int.tryParse(dateTime.split('-')[1]);
  final year = dateTime.split('-')[0];
  return '$date ${monthList[month ?? 0]} $year';
}
