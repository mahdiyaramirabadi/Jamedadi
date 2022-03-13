import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/dbhelper.dart';
import 'package:jamedadi/dict_page/dictPage.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'course.dart';

class Dictionary extends StatefulWidget {
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  DbHelper? helper;
  TextEditingController teSeach = TextEditingController();
  var allCourses = [];
  var items = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    helper = DbHelper();
    helper!.allCourses().then((courses) {
      setState(() {
        allCourses = courses;
        items = allCourses;
      });
    });
    // CheckDB();
  }

  void filterSeach(String query) async {
    var dummySearchList = allCourses;
    if (query.isNotEmpty) {
      var dummyListData = [];
      dummySearchList.forEach((item) {
        var course = Course.fromMap(item);
        if (course.word!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items = [];
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items = [];
        items = allCourses;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: InkWell(
            child: Text(
              "لغتنامه",
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
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(1, 206, 209, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.75),
                      offset: const Offset(
                        0.0,
                        0.0,
                      ),
                      blurRadius: 50.0,
                      spreadRadius: 6.0,
                    ) //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                    // color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 10, top: 6, bottom: 6),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          filterSeach(value);
                        });
                      },
                      textAlign: TextAlign.right,
                      controller: teSeach,
                      decoration: InputDecoration(
                          hintText: '...جستجو',
                          hintStyle:
                              TextStyle(color: Colors.white.withOpacity(0.9)),
                          prefixIcon: Icon(
                            Iconsax.search_normal,
                            color: Colors.white,
                          ),
                          focusColor: Colors.white,
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, right: 8, left: 8),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      Course course = Course.fromMap(items[i]);
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(
                            '${course.word}',
                            textDirection: TextDirection.rtl,
                          ),
                          // subtitle: Text(course.meaning!.substring(0, 800)),
                          onTap: () {
                            print(course.meaning);
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => DictPage(course)));
                          },
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Word {
  int? id;
  String? word;
  String? meaning;

  Word({this.id, this.word, this.meaning});
  factory Word.fromMap(Map<String, dynamic> json) => new Word(
        id: json["id"],
        word: json["word"],
        meaning: json["meaning"],
      );
}

// class Dict {
//   // int? id;
//   String? word;

//   Dict({
//     required this.word,
//   });

//   Dict.fromJson(Map<dynamic, dynamic> json) {
//     word = json['word'];
//     // id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['word'] = this.word;
//     // data['id'] = this.id;
//     print(data);

//     return data;
//   }
// }
