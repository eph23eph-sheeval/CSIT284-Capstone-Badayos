import 'package:flutter/material.dart';
import '../library_store.dart';
import '../widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  final LibraryStore store;
  const HistoryScreen({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
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
          itemBuilder: (context, i) => HistoryCard(entry: history[i]),
        );
      },
    );
  }
}
