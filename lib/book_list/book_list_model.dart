
import 'package:booklist/domain/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookListModel extends ChangeNotifier {
  List<Book>? books;

  void fetchBookList() async {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection('add').get();

    final List<Book> books = snapshot.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String id = document.id;
      final String startTime = data['startTime'];
      final String endTime = data['endTime'];
      final String startTitle = data['startTitle'];
      final String endTitle = data['endTitle'];
      final String philo = data['philosophy'];
      final String addTodo = data['addTodo'];
      return Book(id, startTime, endTime,startTitle,endTitle,philo,addTodo);
    }).toList();

    this.books = books;
    notifyListeners();
  }

  Future delete(Book book) {
    return FirebaseFirestore.instance.collection('books').doc(book.id).delete();
  }
}