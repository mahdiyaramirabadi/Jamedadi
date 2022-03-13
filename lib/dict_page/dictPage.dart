import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/course.dart';
import 'package:jamedadi/dbhelper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DictPage extends StatelessWidget {
  // Course get course => course;
  Course? course;

  DictPage(Course course);
  CourseDetails() {
    // TODO: implement CourseDetails
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: InkWell(
            child: Text(
              course!.word.toString(),
              style: TextStyle(
                fontFamily: "Vazir",
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: Icon(Iconsax.arrow_left_2,
                color: Theme.of(context).primaryColor),
          ),
        ),
        body: BodyUI());
  }

  // Widget build(BuildContext context) {
  //   int _selected_index = 0;
  //   // final themeProvider = Provider.of<ThemeProvider>(context);
  //   return Scaffold(
  //       backgroundColor: Theme.of(context).backgroundColor,
  //       appBar: AppBar(
  //         title: InkWell(
  //           child: Text(
  //             "لغتنامه",
  //             style: TextStyle(
  //               fontFamily: "Vazir",
  //               color: Theme.of(context).primaryColor,
  //             ),
  //           ),
  //         ),
  //         centerTitle: true,
  //         backgroundColor: Theme.of(context).accentColor,
  //         elevation: 0,
  //         leading: IconButton(
  //           onPressed: () {
  //             Navigator.of(context).pop(true);
  //           },
  //           icon: Icon(Iconsax.arrow_left_2,
  //               color: Theme.of(context).primaryColor),
  //         ),
  //       ),
  //       body: BodyUI());
  // }

  Widget BodyUI() {
    return Container();
  }
}
