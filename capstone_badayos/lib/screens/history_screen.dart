import 'package:flutter/material.dart';
import '../library_store.dart';
import '../models.dart';

class HistoryScreen extends StatelessWidget {
  final LibraryStore store;
  const HistoryScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        final history = store.history;
        if (history.isEmpty) {
          return const Center(child: Text('No borrow history yet'));
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: history.length,
          itemBuilder: (context, i) {
            final HistoryEntry e = history[i];
            final returned = e.returnDate != null;
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(e.bookTitle,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text('Borrowed: ${formatDate(e.borrowDate)}'),
                    Text('Due: ${formatDate(e.dueDate)}'),
                    Text(
                      returned
                          ? 'Returned: ${formatDate(e.returnDate!)}'
                          : 'Not yet returned',
                      style: TextStyle(
                          color: returned ? scheme.primary : scheme.error),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
