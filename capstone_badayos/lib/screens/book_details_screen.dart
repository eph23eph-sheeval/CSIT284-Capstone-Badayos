import 'package:flutter/material.dart';
import '../library_store.dart';
import '../models/book.dart';
import '../utils.dart';

class BookDetailsScreen extends StatelessWidget {
  final LibraryStore store;
  final int bookId;
  const BookDetailsScreen({super.key, required this.store, required this.bookId});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: ListenableBuilder(
        listenable: store,
        builder: (context, _) {
          final Book? book = store.bookById(bookId);
          if (book == null) {
            return const Center(child: Text('Book not found'));
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title, style: textTheme.headlineSmall),
                const SizedBox(height: 4),
                Text('by ${book.author}', style: textTheme.bodyLarge),
                const SizedBox(height: 16),
                Text(
                  book.isAvailable ? 'Status: Available' : 'Status: Borrowed',
                  style: textTheme.titleMedium,
                ),
                if (!book.isAvailable) ...[
                  const SizedBox(height: 4),
                  Text('Due date: ${formatDate(book.dueDate!)}',
                      style: TextStyle(color: scheme.error)),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: book.isAvailable
                      ? FilledButton(
                          onPressed: () => store.borrow(book.id),
                          child: const Text('Borrow'),
                        )
                      : OutlinedButton(
                          onPressed: () => store.returnBook(book.id),
                          child: const Text('Return'),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
