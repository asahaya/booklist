
import 'package:booklist/domain/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditBookModel extends ChangeNotifier {
  final Book book;

  EditBookModel(this.book) {
    startTimeController.text = book.startTime;
    endTimeController.text = book.endTime;
    startTitleController.text = book.startTitle;
    endTitleController.text = book.endTitle;
    philosophyController.text = book.philo;
    addTodoController.text = book.addTodo;
  }

  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final startTitleController = TextEditingController();
  final endTitleController = TextEditingController();
  final philosophyController = TextEditingController();
  final addTodoController = TextEditingController();


  String? id;
  String? startTime;
  String? endTime;
  String? startTitle;
  String? endTitle;
  String? philo;
  String? addTodo;


  void setStartTime(String text) {
    this.startTime = startTime;
    notifyListeners();
  }

  void setStartTitle(String text) {
    this.startTitle = startTitle;
    notifyListeners();
  }

  void setPhilo(String text) {
    this.philo = philo;
    notifyListeners();
  }

  void setEndTitle(String text) {
    this.endTitle = endTitle;
    notifyListeners();
  }

  void setAddTodo(String text) {
    this.addTodo = addTodo;
    notifyListeners();
  }

  void setEndTime(String text) {
    this.endTime=endTime;
    notifyListeners();
  }





  bool isUpdated() {
    return startTime != null || endTime != null|| startTitle != null|| endTitle != null|| philo != null|| addTodo != null;
  }

  Future update() async {

   this.startTime= startTimeController.text;
    this.endTime=  endTimeController.text ;
    this.startTitle=  startTitleController.text;
    this.endTitle=  endTitleController.text ;
    this.philo=  philosophyController.text;
    this.addTodo=  addTodoController.text ;


    // firestoreに追加
    await FirebaseFirestore.instance.collection('add').doc(book.id).update({
      'startTime': startTime,
      'endTime': endTime,
      'startTitle': startTitle,
      'endTitle': endTitle,
      'philosophy': philo,
      'addTodo': addTodo,
    });
  }




}