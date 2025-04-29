String dateget() {
  DateTime now = DateTime.now();
  String stringdate = DateTime(now.year, now.month, now.day).toString();
  final date = stringdate.split(' ');
  final splitdate = date[0].split('-');
  List<String> rearranged = [splitdate[2], splitdate[1], splitdate[0]];
  String correctdate = rearranged.join('-');
  return correctdate;
}
