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
