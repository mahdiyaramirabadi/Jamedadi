import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamedadi/ToDo_List/TodoClass.dart';

// import 'package:persian_datetime_picker/persian_datetime_picker.dart';
String? new_time;
String? new_name;

class EditTodo extends StatelessWidget {
  final bool reverse;
  Todo todo;

  EditTodo({Key? key, this.reverse = false, required this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectedTime;
    String _hour = todo.time.split(":")[0];
    String _minute = todo.time.split(":")[1];

    TextEditingController _hrCr = TextEditingController();
    Future<void> _show() async {
      final TimeOfDay? result = await showTimePicker(
          context: context,
          cancelText: "لغو",
          confirmText: "تایید",
          hourLabelText: "ساعت",
          minuteLabelText: "دقیقه",
          helpText: "",
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child!);
          });
      if (result != null) {
        _hour = result.hour.toString();
        _minute = result.minute.toString();
        _hrCr = TextEditingController(text: "8");
        todo.time = result.hour.toString() + ":" + result.minute.toString();
        new_time = result.hour.toString() + ":" + result.minute.toString();
      }
      // var picked = await showTimePicker(
      //   context: context,
      //   initialTime: TimeOfDay.now(),
      // );
      // var label = picked!.persianFormat(context);
    }

    var textcontroller = TextEditingController(text: todo.name);
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).accentColor,
          border: Border.all(width: 0, color: Theme.of(context).accentColor),
          leading: Container(),
          middle: Text(
            "ویرایش",
            style: TextStyle(
                fontFamily: "Vazir",
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Column(children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "عنوان:",
                      style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            border: Border.all(
                                width: 1, color: Theme.of(context).accentColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: TextField(
                            // autofocus: true,
                            textDirection: TextDirection.rtl,
                            controller: textcontroller,
                            cursorColor: Theme.of(context).accentColor,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'خرید خانه...',
                              hintTextDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      "ساعت:",
                      style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: 20,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          print(todo.time);
                          _show();
                          print(todo.time);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).accentColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  _hour,
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 8.0, left: 8),
                                child: Text(
                                  ":",
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context).accentColor),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  _minute,
                                  style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Theme.of(context).accentColor),
                  height: MediaQuery.of(context).size.height / 13,
                  child: InkWell(
                    onTap: () {
                      // todo.name = textcontroller.text;
                      // todo.time = new_time;
                      new_name = textcontroller.text;
                      Navigator.of(context).pop();
                    },
                    child: Center(
                      child: Text(
                        "ثبت",
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            )),
      ),
    );
  }
}
