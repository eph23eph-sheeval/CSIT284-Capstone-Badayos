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
