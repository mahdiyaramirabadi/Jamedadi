import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jamedadi/Theme_Provider.dart';
import 'package:jamedadi/lesson.dart';
import 'package:jamedadi/settingspage.dart';
import 'package:jamedadi/theme_notifier.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'BottomNavigator.dart';
import 'ThemeManager.dart';
// import 'package:http/http.dart';
import 'homeItem.dart';
import 'tools.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

void main() {
  return runApp(MyApp());
}

bool isDarkModeEnabled1 = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme! ? dark : light,
            home: home(),
            title: "Jamedadi",
          );
        }),
        // builder: (context, _) {
        //   final themeProvider = Provider.of<ThemeProvider>(context);
        //   return MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     themeMode: themeProvider.themeMode,
        //     theme: lightTheme,
        //     darkTheme: darkTheme,
        //     home: home(),
        //     title: "Jamedadi",
        //   );
        // }
      );
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<HomeItem> _items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: Text(
          "جامدادی",
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: Icon(Icons.ios_share, color: Theme.of(context).accentColor),
      ),
      body: BodyUI(context),
    );
  }

  Widget BodyUI(context) {
    String ad_url =
        "https://click.digiato.com/media/1acaf85b1785aec313667b8e3654164f-3b26571911b67ee2f2757419e75213a3-2ec8a245f522e5147a440685adf1e499-c41a106fa09320a6e7c0c4379f5bc781";

    return Builder(
      builder: (context) => Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Material(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0)),
                  color: Theme.of(context).primaryColor,
                  elevation: 20,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50,
                        bottom: MediaQuery.of(context).size.height / 20,
                        left: 5),
                    child: Row(
                      children: [
                        generateItem("نمونه سوالات", "test", context),
                        generateItem("درسنامه ها", "lesson", context),
                        generateItem("ابزارها", "tool", context)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 8,
                child: translateCard("لغتنامه(بزودی)", "translate", context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 8,
                child: settingCard("تنظیمات", "settings", context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Container(
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: NetworkImage(ad_url),
                      //   ),
                      // ),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "AD",
                            style: TextStyle(
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 5,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  //
  // void fetchItems() async {
  //   var url = "http://testhost.freecloudsite.com/home.json";
  //   Response respnse = await get(url);
  //   print(respnse.statusCode);
  //   if(respnse.statusCode != 200){
  //     var homeItem = HomeItem("خطا در برقراری با سرور ...", 12);
  //     _items.add(homeItem);
  //   }else if
  //   (respnse.statusCode == 200){
  //   setState(() {
  //     var ItemJson = jsonDecode(utf8.decode(respnse.bodyBytes));
  //     for (var i in ItemJson) {
  //       var homeItem = HomeItem(i['text'],i['id']);
  //       _items.add(homeItem);
  //     }
  //     print(_items);
  //
  //   });
  // }
  // }
  //

}

Widget generateItem(String title, String id, context) {
  return Card(
    color: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    elevation: 8,
    child: Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          if (id == "tool") {
            Navigator.push(
                context,
                PageTransition(
                  curve: Curves.linear,
                  type: PageTransitionType.scale,
                  alignment: Alignment.topCenter,
                  duration: Duration(seconds: 1),
                  child: toolsItem(),
                ));
          } else if (id == "lesson") {
            Navigator.push(
                context,
                PageTransition(
                  curve: Curves.linear,
                  type: PageTransitionType.scale,
                  alignment: Alignment.topCenter,
                  duration: Duration(seconds: 1),
                  child: TabDream11(),
                ));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: 100,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Vazir",
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Theme.of(context).accentColor,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget translateCard(String title, String id, context) {
  return Padding(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: Card(
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      elevation: 15,
      child: Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            if (id == "tool") {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => toolsItem()));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width / 3.3,
                      height: 100,
                      child: Icon(
                        Icons.chevron_left,
                        color: Theme.of(context).accentColor,
                        size: MediaQuery.of(context).size.width / 14,
                      )),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width / 3,
                    height: 100,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: "Vazir",
                        fontSize: MediaQuery.of(context).size.width / 19,
                        color: Theme.of(context).accentColor,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget settingCard(String title, String id, context) {
  return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        elevation: 15,
        child: Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              if (id == "settings") {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width / 3.3,
                        height: 100,
                        child: Icon(
                          Icons.chevron_left,
                          color: Theme.of(context).accentColor,
                          size: MediaQuery.of(context).size.width / 14,
                        )),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width / 3.3,
                      height: 100,
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: MediaQuery.of(context).size.width / 19,
                          color: Theme.of(context).accentColor,
                        ),
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
}
//
// Padding(
// padding: EdgeInsets.all(5.0),
// child: GridView.count(
// // childAspectRatio: 3,
// crossAxisCount: 3,
// crossAxisSpacing: 10,
// mainAxisSpacing: 15,
// children: List.generate(_items.length, (int position){
// return generateItem(_items[position],context);
//
// }),
// ),
// ),