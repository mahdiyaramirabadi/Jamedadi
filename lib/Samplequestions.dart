import 'dart:convert';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:jamedadi/main.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:http/http.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'lesson value/lesson_value.dart';

class Samplequestion extends StatefulWidget {
  @override
  _SamplequestionState createState() => _SamplequestionState();
}

class _SamplequestionState extends State<Samplequestion> {
  List<Lesson_Value> _items = [];
  List<Lesson_Value> _items_oloom = [];
  List<Lesson_Value> _items_math = [];

  List<String> categories = [
    "ریاضی",
    "علوم تجربی",
    "ادبیات",
    "اجتماعی",
    "پیام های آسمان",
    "عربی"
  ];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "نمونه سوالات",
                style: TextStyle(
                    fontFamily: "Vazir", color: Theme.of(context).primaryColor),
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).accentColor,
              elevation: 0,
              leading: SizedBox(),
              bottom: PreferredSize(
                  child: TabBar(
                      isScrollable: true,
                      indicatorColor: Theme.of(context).primaryColor,
                      tabs: [
                        Tab(
                          child: Text(
                            categories[0],
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            categories[1],
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            categories[2],
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            categories[3],
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            categories[4],
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ),
                        Tab(
                          child: Text(
                            categories[5],
                            style: TextStyle(
                                fontFamily: "Vazir",
                                color: Theme.of(context).primaryColor,
                                fontSize: 18),
                          ),
                        ),
                      ]),
                  preferredSize: Size.fromHeight(40.0)),
            ),
            body: TabBarView(
              children: <Widget>[
                Container(

                    // child: ListView.separated(
                    //   physics: BouncingScrollPhysics(),
                    //   itemCount: _items_math.length,
                    //   separatorBuilder: (BuildContext context, int index) =>
                    //       Divider(
                    //     color: Theme.of(context).hintColor,
                    //     height: 2,
                    //     indent: 5.0,
                    //     endIndent: 5.0,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       title: Text(
                    //         '${_items_math[index].fileName}',
                    //         style: TextStyle(
                    //             fontFamily: "Vazir",
                    //             color: Theme.of(context).hintColor),
                    //         textDirection: TextDirection.rtl,
                    //       ),
                    //       trailing: IconButton(
                    //         tooltip: "دانلود",
                    //         icon: Icon(
                    //           Icons.download_rounded,
                    //           textDirection: TextDirection.rtl,
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //     );
                    //   },
                    // ),
                    ),
                Container(
                    // child: ListView.separated(
                    //   physics: BouncingScrollPhysics(),
                    //   itemCount: _items_oloom.length,
                    //   separatorBuilder: (BuildContext context, int index) =>
                    //       Divider(
                    //     color: Theme.of(context).hintColor,
                    //     height: 2,
                    //     indent: 5.0,
                    //     endIndent: 5.0,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       title: Text(
                    //         '${_items_oloom[index].fileName}',
                    //         style: TextStyle(
                    //             fontFamily: "Vazir",
                    //             color: Theme.of(context).hintColor),
                    //         textDirection: TextDirection.rtl,
                    //       ),
                    //       trailing: IconButton(
                    //         tooltip: "دانلود",
                    //         icon: Icon(
                    //           Icons.download_rounded,
                    //           textDirection: TextDirection.rtl,
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //     );
                    //   },
                    // ),
                    ),
                Container(
                    // child: ListView.separated(
                    //   physics: BouncingScrollPhysics(),
                    //   itemCount: _items_oloom.length,
                    //   separatorBuilder: (BuildContext context, int index) =>
                    //       Divider(
                    //     color: Theme.of(context).hintColor,
                    //     height: 2,
                    //     indent: 5.0,
                    //     endIndent: 5.0,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       title: Text(
                    //         '${_items_oloom[index].fileName}',
                    //         style: TextStyle(
                    //             fontFamily: "Vazir",
                    //             color: Theme.of(context).hintColor),
                    //         textDirection: TextDirection.rtl,
                    //       ),
                    //       trailing: IconButton(
                    //         tooltip: "دانلود",
                    //         icon: Icon(
                    //           Icons.download_rounded,
                    //           textDirection: TextDirection.rtl,
                    //         ),
                    //         onPressed: () {},
                    //       ),
                    //     );
                    //   },
                    // ),
                    ),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ));
  }

  void fetchItems() async {
    _items = [];
    _items_math = [];
    _items_oloom = [];
    bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();

    print("is $isConnected");

    void _showDialog(
        String title, String content, String btntext, BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: new Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                  textDirection: TextDirection.rtl,
                ),
                content: new Text(content,
                    style: Theme.of(context).textTheme.bodyText1,
                    textDirection: TextDirection.rtl),
                actions: <Widget>[
                  new FlatButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                        Navigator.of(context).pop(true);

                        fetchItems();
                      },
                      child: new Text(
                        btntext,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ]);
          });
    }

    void _showDialog2(
        String title, String content, String btntext, BuildContext context) {
      showAnimatedDialog(
          animationType: DialogTransitionType.slideFromBottomFade,
          curve: Curves.fastOutSlowIn,
          duration: Duration(seconds: 1),
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(
                title,
                style: Theme.of(context).textTheme.headline5,
                textDirection: TextDirection.rtl,
              ),
              content: new Text(content,
                  style: Theme.of(context).textTheme.bodyText1,
                  textDirection: TextDirection.rtl),
              actions: <Widget>[
                new FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      Navigator.of(context).pop(true);
                    },
                    child: new Text(
                      btntext,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ))
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            );
          });
    }

    setState(() {
      _showDialog2(
          "در حال توسعه....",
          "این بخش در حال توسعه است و بزودی راه اندازی خواهد شد",
          "بازگشت",
          context);
    });

    var url = "https://rodgraphic.ir/jamedadi/test.json";

    if (isConnected == true) {
      Response response = await get(Uri.parse(url));
      setState(() {
        var productJson = json.decode(utf8.decode(response.bodyBytes));
        for (var i in productJson) {
          if (i['category'] == "oloom") {
            var productItem = Lesson_Value(i['name'], i['url'], i['category']);

            _items_oloom.add(productItem);
          } else if (i['category'] == "math") {
            var productItem = Lesson_Value(i['name'], i['url'], i['category']);

            _items_math.add(productItem);
          }
          var productItem = Lesson_Value(i['name'], i['url'], i['category']);

          _items.add(productItem);
        }
      });
    } else {
      var productItem = Lesson_Value("null", "null", "null");

      _items.add(productItem);
      _items_math.add(productItem);
      _items_oloom.add(productItem);

      _showDialog(
          "خطا در ارتباط با سرور",
          "به نظر می  رسد اتصال اینترنت شما کند و یا قطع است!لطفا وضعیت اتصال خود را بررسی کنید",
          "امتحان دوباره",
          context);

      print("internet no connected");
      print(isConnected.toString());
    }
  }
}

Container generateItem(Lesson_Value product, context) {
  return Container(
    padding: EdgeInsets.all(0),
    decoration: BoxDecoration(
      border: Border(
          bottom: BorderSide(width: .5, color: Theme.of(context).hintColor)),
    ),
    child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            '${product.fileName}',
            style: TextStyle(
                fontFamily: "Vazir", color: Theme.of(context).hintColor),
            textDirection: TextDirection.rtl,
          ),
          trailing: IconButton(
            tooltip: "دانلود",
            icon: Icon(
              Icons.download_rounded,
              textDirection: TextDirection.rtl,
            ),
            onPressed: () {},
          ),
        )),
  );
}
