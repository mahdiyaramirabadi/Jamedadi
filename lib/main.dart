import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/Samplequestions.dart';
import 'package:jamedadi/Theme_Provider.dart';
import 'package:jamedadi/ToDo_List/TodoClass.dart';
import 'package:jamedadi/ToDo_List/mainPage.dart';
import 'package:jamedadi/dict_page/dictionary.dart';
import 'package:jamedadi/lesson.dart';
import 'package:jamedadi/settingspage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:http/http.dart';
import 'homeItem.dart';
import 'tools.dart';
import 'package:share_plus/share_plus.dart';
import 'package:jamedadi/ToDo_List/CardClass.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Colors.blue.withOpacity(0), // navigation bar color
    statusBarColor: Color.fromRGBO(0, 0, 0, 0), // status bar color
  ));
  await Hive.initFlutter();
  Hive.registerAdapter(CardTodoAdapter());
  Hive.registerAdapter(ColorAdapter());
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<CardTodo>('TodoCard');
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
            title: "Jabe Abzar",
          );
        }),
      );
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "dict.db");

    if (!await databaseExists(path)) {
      print("database is create");

      // Create Database if Not Exists.
      try {
        await Directory(dirname(path)).create(recursive: true);

        ByteData data = await rootBundle.load(join("assets/", "dict.db"));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        await File(path).writeAsBytes(bytes, flush: true);
      } catch (e) {
        log('$e');
      }
    } else {
      print("database is open");
    }
    var db = await openDatabase(path);
    var result = db.query("moin_table");
    print(result.toString());
    return db;
  }

  static GlobalKey previewContainer = GlobalKey();
  List<HomeItem> _items = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
          title: Text(
            "جعبه ابزار",
            style: TextStyle(
              fontFamily: "Vazir",
              color: Theme.of(context).accentColor,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          leading: SizedBox()),
      body: BodyUI(context),
    );
  }

  Widget BodyUI(context) {
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
                        // generateItem("نمونه سوالات", "samplequestion", context),
                        // generateItem("درسنامه ها", "lesson", context),
                        generateItem("فهرست کارها", "ToDo", context),
                        generateItem("واژه نامه", "dict", context),
                        generateItem("ابزارها", "tool", context)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 8,
              //   child: BottomTile("لغتنامه", "dict", context),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 30,
              // ),
              // Container(
              //   height: MediaQuery.of(context).size.height / 8,
              //   child: BottomTile("فهرست کارها", "ToDo", context),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 30,
              // ),
              Container(
                height: MediaQuery.of(context).size.height / 8,
                child: settingCard("تنظیمات", "settings", context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),

              // Expanded(
              //   child: CachedNetworkImage(
              //     imageUrl: "https://www.rodgraphic.ir/jamedadi/logo.png",
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(left: 10, right: 10),
              //   child: Container(
              //     height: MediaQuery.of(context).size.height / 4,
              //     width: MediaQuery.of(context).size.width,
              //     child: Card(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.all(Radius.circular(30)),
              //       ),
              //       child: Container(
              //         // decoration: BoxDecoration(
              //         //   image: DecorationImage(
              //         //     image: NetworkImage(ad_url),
              //         //   ),
              //         // ),
              //         child: Padding(
              //             padding: EdgeInsets.all(10),
              //             child: Text(
              //               "AD",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 shadows: <Shadow>[
              //                   Shadow(
              //                     offset: Offset(0.0, 0.0),
              //                     blurRadius: 5,
              //                     color: Color.fromARGB(255, 0, 0, 0),
              //                   ),
              //                 ],
              //               ),
              //             )),
              //       ),
              //     ),
              //   ),
              // )
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
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => toolsItem()));
          } else if (id == "lesson") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Lesson()));
          } else if (id == "samplequestion") {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Samplequestion()));
          } else if (id == "dict") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Dictionary()));
          } else if (id == "ToDo") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ToDoPage()));
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

Widget BottomTile(String title, String id, context) {
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
            if (id == "translate") {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dictionary()));
            } else if (id == "ToDo") {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ToDoPage()));
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