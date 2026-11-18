import 'package:flutter/material.dart';
import '../models/history_entry.dart';
import '../utils.dart';

class HistoryCard extends StatelessWidget {
  final HistoryEntry entry;
  const HistoryCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final returned = entry.returnDate != null;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.bookTitle,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text('Borrowed: ${formatDate(entry.borrowDate)}'),
            Text('Due: ${formatDate(entry.dueDate)}'),
            Text(
              returned
                  ? 'Returned: ${formatDate(entry.returnDate!)}'
                  : 'Not yet returned',
              style: TextStyle(color: returned ? scheme.primary : scheme.error),
            ),
          ],
        ),
      ),
    );
  }
}
