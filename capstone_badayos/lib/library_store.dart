import 'package:flutter/foundation.dart';
import 'models.dart';
import 'sample_data.dart';

class LibraryStore extends ChangeNotifier {
  // Week 1: hardcoded student. Week 2: replace with student ID input.
  static const String studentId = '2024-00001';
  static const int loanDays = 7;

  final List<Book> _books = sampleBooks();
  final List<HistoryEntry> _history = [];
  String _query = '';
  int _nextHistoryId = 1;

  String get query => _query;

  List<Book> get filteredBooks {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return List.unmodifiable(_books);
    return _books
        .where((b) =>
            b.title.toLowerCase().contains(q) ||
            b.author.toLowerCase().contains(q))
        .toList();
  }

  List<HistoryEntry> get history => List.unmodifiable(_history);

  Book? bookById(int id) {
    for (final b in _books) {
      if (b.id == id) return b;
    }
    return null;
  }

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void borrow(int bookId) {
    final book = bookById(bookId);
    if (book == null || !book.isAvailable) return;
    final today = DateTime.now();
    final due = today.add(const Duration(days: loanDays));
    book.isAvailable = false;
    book.borrowedBy = studentId;
    book.dueDate = due;
    _history.insert(
      0,
      HistoryEntry(
        id: _nextHistoryId++,
        bookId: book.id,
        bookTitle: book.title,
        borrowDate: today,
        dueDate: due,
      ),
    );
    notifyListeners();
  }

  void returnBook(int bookId) {
    final book = bookById(bookId);
    if (book == null || book.isAvailable) return;
    book.isAvailable = true;
    book.borrowedBy = null;
    book.dueDate = null;
    for (final h in _history) {
      if (h.bookId == bookId && h.returnDate == null) {
        h.returnDate = DateTime.now();
        break;
      }
    }
    notifyListeners();
  }
}
