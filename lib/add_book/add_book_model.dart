import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddBookModel extends ChangeNotifier {

  String? startTime;
  String? endTime;
  String? startTitle;
  String? endTitle;
  String? philo;
  String? addTodo;

  Future addBook() async {
    if (startTime == null || startTime == "") {
      throw '開始時間が入力されてません';
    }

    if (endTime == null || endTime!.isEmpty) {
      throw '終了時間が入力されてません';
    }

    // firestoreに追加
    await FirebaseFirestore.instance.collection('add').add({
      'startTime': startTime,
      'endTime': endTime,
      'startTitle': startTitle,
      'endTitle': endTitle,
      'philosophy': philo,
      'addTodo': addTodo,
    });
  }
}
