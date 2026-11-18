import 'package:flutter/material.dart';
import '../models/book.dart';
import '../utils.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        title: Text(book.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(book.author),
            const SizedBox(height: 4),
            book.isAvailable
                ? Text('Available', style: TextStyle(color: scheme.primary))
                : Text('Borrowed - due ${formatDate(book.dueDate!)}',
                    style: TextStyle(color: scheme.error)),
          ],
        ),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
