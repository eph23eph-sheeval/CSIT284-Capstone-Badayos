class Book {
  final int id;
  final String title;
  final String author;
  bool isAvailable;
  String? borrowedBy;
  DateTime? dueDate;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.isAvailable = true,
    this.borrowedBy,
    this.dueDate,
  });
}

class HistoryEntry {
  final int id;
  final int bookId;
  final String bookTitle;
  final DateTime borrowDate;
  final DateTime dueDate;
  DateTime? returnDate;

  HistoryEntry({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.borrowDate,
    required this.dueDate,
    this.returnDate,
  });
}

String formatDate(DateTime d) {
  final month = d.month.toString().padLeft(2, '0');
  final day = d.day.toString().padLeft(2, '0');
  return '${d.year}-$month-$day';
}
