import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/ToDo_List/EditTodo.dart';
import 'package:jamedadi/ToDo_List/TodoClass.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

var ic = Icons.circle_outlined;

class TodoItem extends StatelessWidget {
  TodoItem(
      {required this.todo,
      required this.onTodoChanged,
      required this.card_index})
      : super(key: ObjectKey(todo));

  final Todo todo;
  final onTodoChanged;
  final int card_index;

  Color todo_title_color = Color.fromRGBO(48, 48, 48, 1);
  Color todo_title_color_checked = Color.fromRGBO(102, 102, 102, 1);
  Icon leading_icon_todo = Icon(
    Icons.circle_outlined,
    size: 19,
    color: Colors.black,
  );

  Color? _getIcColor(bool checked) {
    if (!checked) return todo_title_color;
    return todo_title_color_checked;
  }

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return TextStyle(color: todo_title_color, fontSize: 16);
    todo_title_color = todo_title_color_checked;
    return TextStyle(
      color: todo_title_color_checked,
      fontSize: 16,
      decoration: TextDecoration.lineThrough,
    );
  }

  IconData? _getIcon(bool checked) {
    if (checked == true) {
      return Icons.check_circle_outline;
    } else {
      return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    String _time = todo.time;
    String name = todo.name;

    return InkWell(
      onLongPress: () async {
        // await showBarModalBottomSheet(
        //   context: context,
        //   expand: false,
        //   backgroundColor: Colors.transparent,
        //   elevation: 10,
        //   duration: Duration(milliseconds: 950),
        //   animationCurve: Curves.easeInOut,
        //   barrierColor: Color.fromRGBO(0, 0, 0, .8),
        //   builder: (context) => EditTodo(
        //     todo: todo,
        //   ),
        // );
        // if (new_time != null && new_name != null) {
        //   _time = new_time!;
        //   name = new_name!;
        // }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 8),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                onTodoChanged(todo, card_index);
              },
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(
                    _getIcon(todo.checked),
                    color: _getIcColor(todo.checked),
                    size: 19,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 9.0),
                          child: Container(
                            width: 170,
                            height: 10,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          todo.name,
                          style: _getTextStyle(todo.checked),
                          textDirection: TextDirection.rtl,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Iconsax.clock,
                      size: 19, color: Theme.of(context).primaryColor),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    _time,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
