import 'package:flutter/material.dart';
import '../library_store.dart';
import '../widgets/book_card.dart';
import 'book_details_screen.dart';

class BookListScreen extends StatefulWidget {
  final LibraryStore store;
  const BookListScreen({super.key, required this.store});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _controller,
            onChanged: widget.store.setQuery,
            decoration: const InputDecoration(
              labelText: 'Search title or author',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ListenableBuilder(
            listenable: widget.store,
            builder: (context, _) {
              final books = widget.store.filteredBooks;
              if (books.isEmpty) {
                return const Center(child: Text('No books found'));
              }
              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: books.length,
                itemBuilder: (context, i) {
                  final book = books[i];
                  return BookCard(
                    book: book,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetailsScreen(
                            store: widget.store, bookId: book.id),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
