import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/ToDo_List/TodoClass.dart';
import 'package:jamedadi/ToDo_List/TodoItemWidget.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'CardClass.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  Jalali TodayDate = Jalali.now();
  String card_title = "";
  List bgColors = [
    [
      Color.fromRGBO(255, 198, 255, 1),
      Color.fromRGBO(255, 182, 255, 1),
    ],
    [
      Color.fromRGBO(189, 178, 255, 1),
      Color.fromRGBO(166, 151, 255, 1),
    ],
    [
      Color.fromRGBO(160, 196, 255, 1),
      Color.fromRGBO(129, 176, 255, 1),
    ],
    [
      Color.fromRGBO(255, 214, 165, 1),
      Color.fromRGBO(252, 197, 131, 1),
    ],
  ];
  final TextEditingController _textFieldController = TextEditingController();
  var _cardBox = Hive.box<CardTodo>('TodoCard');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "فهرست کارها",
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (_cardBox.values.length != 0) {
                    int last_index = _cardBox.values.length - 1;
                    _cardBox.deleteAt(last_index);
                  }
                });
              },
              icon: Icon(Iconsax.minus_square,
                  size: 28, color: Theme.of(context).accentColor),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            int month = TodayDate.month;
            int day = TodayDate.day;
            int _new_day = 0;
            int len = _cardBox.values.length;

            if (len != 0) {
              int _last_day =
                  int.parse(_cardBox.getAt(len - 1)!.date.split("/")[1]);
              _new_day = _last_day;
            } else if (len == 0) {
              _new_day = day - 1;
            }
            setState(() {
              day = _new_day + 1;
              if (month <= 6) {
                if (day == 31) {
                  day = 1;
                  month++;
                }
              } else {
                if (day == 30) {
                  day = 1;
                  month++;
                }
              }
              String date = month.toString() + "/" + day.toString();
              List<Color> colors = bgColors[_new_day % 4];
              _cardBox
                  .add(CardTodo(date: date, colors: colors, todos: <Todo>[]));
            });
          },
          icon: Icon(
            Iconsax.add_square,
            color: Theme.of(context).accentColor,
            size: 28,
          ),
        ),
      ),
      body: ToDoUI(),
    );
  }

  Widget ToDoUI() {
    return Builder(
      builder: (context) => Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 18, right: 18, top: 10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _cardBox.values.length,
                itemBuilder: (context, i) {
                  final _key_list = List<String>.generate(
                      _cardBox.values.length, (i) => i.toString());
                  _setTitleTile(_cardBox.getAt(i)!.date);
                  return Dismissible(
                    key: Key(_cardBox.getAt(i)!.date),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        _cardBox.deleteAt(i);
                      });
                    },
                    background: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Iconsax.trash,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                        minHeight: 200,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: _cardBox.getAt(i)!.colors)),
                      width: MediaQuery.of(context).size.width,
                      // height: 200,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      _displayDialog(i);
                                    },
                                    focusColor: Colors.white.withOpacity(0),
                                    splashColor: Colors.white.withOpacity(0),
                                    highlightColor: Colors.white.withOpacity(0),
                                    hoverColor: Colors.white.withOpacity(0),
                                    icon: Icon(
                                      Iconsax.add_square,
                                      color: Theme.of(context).primaryColor,
                                      size: 28,
                                    )),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(Icons.circle,
                                        color: Theme.of(context).primaryColor),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      card_title,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: _cardBox.getAt(i)!.todos.map((
                                Todo todo,
                              ) {
                                return Dismissible(
                                  key: UniqueKey(),
                                  background: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    alignment: Alignment.centerRight,
                                    child: const Icon(
                                      Iconsax.trash,
                                      size: 20,
                                    ),
                                  ),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (direction) {
                                    setState(() {
                                      CardTodo? _card = _cardBox.getAt(i);
                                      List<Color>? _colors = _card!.colors;
                                      String _date = _card.date;
                                      List<Todo> _todos = _card.todos;
                                      int _index = _todos.indexOf(todo);
                                      _todos.removeAt(_index);
                                      _cardBox.putAt(
                                          i,
                                          CardTodo(
                                              date: _date,
                                              colors: _colors,
                                              todos: _todos));
                                    });
                                  },
                                  child: TodoItem(
                                    todo: todo,
                                    onTodoChanged: _handleTodoChange,
                                    card_index: i,
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
    );
  }

  void _setTitleTile(String date) {
    String _today = TodayDate.month.toString() + "/" + TodayDate.day.toString();
    int month = TodayDate.month;
    int day = TodayDate.day;
    if (date == _today) {
      card_title = "امروز";
    } else if (int.parse(date.split("/")[1]) == day + 1) {
      card_title = "فردا";
    } else if (int.parse(date.split("/")[1]) == day - 1) {
      card_title = "دیروز";
    } else {
      card_title = date;
    }
  }

  void _handleTodoChange(Todo todo, int card_index) {
    setState(() {
      // todo.checked = !todo.checked;
      CardTodo? _card = _cardBox.getAt(card_index);
      List<Color>? _colors = _card!.colors;
      String _date = _card.date;
      List<Todo> _todos = _card.todos;
      int _index = _todos.indexOf(todo);
      _todos[_index].checked = !todo.checked;
      _cardBox.putAt(
          card_index, CardTodo(date: _date, colors: _colors, todos: _todos));
    });
  }

  Future<void> _displayDialog(int _index) async {
    showAnimatedDialog(
        animationType: DialogTransitionType.slideFromBottomFade,
        curve: Curves.fastOutSlowIn,
        duration: Duration(seconds: 1),
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "یک کار جدید اضافه کن",
              style: Theme.of(context).textTheme.headline5,
              textDirection: TextDirection.rtl,
            ),
            content: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).accentColor,
                    width: 1.0,
                  ),
                ),
              ),
              child: TextField(
                textDirection: TextDirection.rtl,
                autofocus: true,
                controller: _textFieldController,
                cursorColor: Theme.of(context).accentColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'خرید خانه...',
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    _addTodoItem(_textFieldController.text, _index);
                  },
                  child: new Text(
                    "تایید",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          );
        });
  }

  void _addTodoItem(String name, int _index) {
    setState(() {
      if (name.isNotEmpty) {
        // ----------------- Time -------------------------
        Jalali _clock = Jalali.now();
        int _hour = _clock.hour;
        int _minute = _clock.minute;
        String _time = _hour.toString() + ":" + _minute.toString();
        // -------------find Card---------------------------
        CardTodo? _card = _cardBox.getAt(_index);
        // ----------get Detail of Card-----------------------------
        List<Color>? _colors = _card!.colors;
        String _date = _card.date;
        List<Todo> _new_todos = _card.todos;
        // ----------- add new Todo-------------------------------
        int _id = _new_todos.length;
        Todo _new_todo = Todo(id: _id, name: name, checked: false, time: _time);
        _new_todos.add(_new_todo);
        // --------------- Update DB-------------------------
        _cardBox.putAt(
            _index, CardTodo(date: _date, colors: _colors, todos: _new_todos));
      }
    });
    _textFieldController.clear();
  }
}
