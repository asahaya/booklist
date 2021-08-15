
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'add_book_model.dart';

class AddBookPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>(
      create: (_) => AddBookModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
        ),
        body: Center(
          child: Consumer<AddBookModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
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
                            keyboardType: TextInputType.datetime,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: '開始時刻',
                            ),
                            onChanged: (text) {
                              model.startTime = text;
                            },
                          ),
                        ),
                        SizedBox(width: 25),
                        SizedBox(
                          height: 70,
                          width: 250,
                          child: TextField(
                            style: TextStyle(fontSize: 20),
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: '開始時場所',
                            ),
                            onChanged: (text) {
                              model.startTitle = text;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 300,
                      child: TextField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: '手段',
                        ),
                        onChanged: (text) {
                          model.philo = text;
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
                            style: TextStyle(fontSize: 20),
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              hintText: '終了時刻',
                            ),
                            onChanged: (text) {
                              model.endTime = text;
                            },
                          ),
                        ),
                        SizedBox(width: 25),
                        SizedBox(
                          height: 70,
                          width: 250,
                          child: TextField(
                            maxLines: null,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              hintText: '終了時場所',
                            ),
                            onChanged: (text) {
                              model.endTitle = text;
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
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: '備考',
                          ),
                          onChanged: (text) {
                            model.addTodo = text;
                          },
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        // 追加の処理
                        try {
                          await model.addBook();
                          Navigator.of(context).pop(true);
                        } catch (e) {
                          final snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text('追加する'),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}