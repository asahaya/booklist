import 'package:booklist/domain/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'edit_book_model.dart';

class EditBookPage extends StatelessWidget {
  final Book book;

  EditBookPage(this.book);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EditBookModel>(
      create: (_) => EditBookModel(book),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を編集'),
        ),
        body: Center(
          child: Consumer<EditBookModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Start"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 80,
                        child: TextField(
                          controller: model.startTimeController,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: '本のタイトル',
                          ),
                          onChanged: (text) {
                            model.setStartTime(text);
                          },
                        ),
                      ),
                      SizedBox(width: 25),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: TextField(
                          controller: model.startTitleController,
                          style: TextStyle(fontSize: 20),
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: '本のタイトル',
                          ),
                          onChanged: (text) {
                            model.setStartTitle(text);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: TextField(
                      controller: model.philosophyController,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: '開始時刻',
                      ),
                      onChanged: (text) {
                        model.setPhilo(text);
                      },
                    ),
                  ),
                  Text("end"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 80,
                        child: TextField(
                          controller: model.endTimeController,
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: '開始時刻',
                          ),
                          onChanged: (text) {
                            model.setEndTime(text);
                          },
                        ),
                      ),
                      SizedBox(width: 25),
                      SizedBox(
                        height: 70,
                        width: 250,
                        child: TextField(
                          controller: model.endTitleController,
                          maxLines: null,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            hintText: '本のタイトル',
                          ),
                          onChanged: (text) {
                            model.setEndTitle(text);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: SizedBox(
                      child: TextField(
                        controller: model.addTodoController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: '本の著者',
                        ),
                        onChanged: (text) {
                          model.setAddTodo(text);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: model.isUpdated()
                        ? () async {
                            // 追加の処理
                            try {
                              await model.update();
                              Navigator.of(context).pop(model.startTitle);
                            } catch (e) {
                              final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(e.toString()),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        : null,
                    child: Text('更新する'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
