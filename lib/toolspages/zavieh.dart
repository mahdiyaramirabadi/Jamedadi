import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';

class Zavieh extends StatefulWidget {
  @override
  _ZaviehState createState() => _ZaviehState();
}

class _ZaviehState extends State<Zavieh> {
  var zelController_d = TextEditingController();
  String _zavieh_d_count = "...";

  // =================================

  var zelController_kh = TextEditingController();
  String _zavieh_kh_count = "...";

  // ===================================

  var zelController_m = TextEditingController();
  String _zavieh_m_count = "...";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "زاویه",
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
                          "زاویه داخلی",
                          style: TextStyle(
                              fontFamily: "Vazir",
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "زاویه خارجی",
                          style: TextStyle(
                              fontFamily: "Vazir",
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "مجموع زوایای داخلی",
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
              SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        right: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.height / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 2.0,
                                color: Theme.of(context).accentColor,
                              ),
                              color: Theme.of(context).primaryColor),
                          child: TextField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).cursorColor,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 20, 40, 20),
                              hintText: "تعداد اضلاع",
                              hintStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              icon: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Icon(Icons.circle,
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: MediaQuery.of(context).size.width / 20,
                              color: Theme.of(context).accentColor,
                            ),
                            controller: zelController_d,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 50,
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
                          width: MediaQuery.of(context).size.width,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(40),
                            onTap: () {
                              if (int.parse(zelController_d.text) > 2) {
                                final snackBar = SnackBar(
                                  content: Text(
                                    "نتایج فقط برای اشکال منظم صحیح هستند",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                zavieh_d(zelController_d.text);
                              } else {
                                final snackBar = SnackBar(
                                  content: Text(
                                    "این شکل اصلا وجود ندارد!!!",
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                );

                                // Find the ScaffoldMessenger in the widget tree
                                // and use it to show a SnackBar.
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Center(
                              child: Text(
                                "محاسبه",
                                style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 2.0,
                                color: Theme.of(context).accentColor,
                              ),
                              color: Theme.of(context).backgroundColor),
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              _zavieh_d_count,
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize:
                                    MediaQuery.of(context).size.width / 18,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 10,
                          right: MediaQuery.of(context).size.width / 10,
                          top: MediaQuery.of(context).size.height / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                color: Theme.of(context).primaryColor),
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "تعداد اضلاع",
                                hintStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Icon(Icons.circle,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                                color: Theme.of(context).accentColor,
                              ),
                              controller: zelController_kh,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
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
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(40),
                              onTap: () {
                                if (int.parse(zelController_kh.text) > 2) {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      "نتایج فقط برای اشکال منظم صحیح هستند",
                                      style: TextStyle(
                                        fontFamily: "Vazir",
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  );

                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                  zavieh_kh(zelController_kh.text);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      "این شکل اصلا وجود ندارد!!!",
                                      style: TextStyle(
                                        fontFamily: "Vazir",
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  );

                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Center(
                                child: Text(
                                  "محاسبه",
                                  style: TextStyle(
                                    fontFamily: "Vazir",
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                color: Theme.of(context).backgroundColor),
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                _zavieh_kh_count,
                                style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize:
                                      MediaQuery.of(context).size.width / 18,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 10,
                          right: MediaQuery.of(context).size.width / 10,
                          top: MediaQuery.of(context).size.height / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                color: Theme.of(context).primaryColor),
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                              ],
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "تعداد اضلاع",
                                hintStyle: TextStyle(
                                    color: Theme.of(context).accentColor),
                                icon: Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Icon(Icons.circle,
                                      color: Theme.of(context).accentColor),
                                ),
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                                color: Theme.of(context).accentColor,
                              ),
                              controller: zelController_m,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 50,
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
                            width: MediaQuery.of(context).size.width,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(40),
                              onTap: () {
                                if (int.parse(zelController_m.text) > 2) {
                                  zavieh_m(zelController_m.text);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(
                                      "به نظرم وقتشه چنین شکلی اختراع کنی :)",
                                      style: TextStyle(
                                        fontFamily: "Vazir",
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Center(
                                child: Text(
                                  "محاسبه",
                                  style: TextStyle(
                                    fontFamily: "Vazir",
                                    fontSize:
                                        MediaQuery.of(context).size.width / 20,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2.0,
                                  color: Theme.of(context).accentColor,
                                ),
                                color: Theme.of(context).backgroundColor),
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Text(
                                _zavieh_m_count,
                                style: TextStyle(
                                  fontFamily: "Vazir",
                                  fontSize:
                                      MediaQuery.of(context).size.width / 18,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  zavieh_d(String z) {
    int zel = int.parse(z);
    if (zel > 2) {
      var zavieh1 = zel - 2;
      var zavieh2 = zavieh1 * 180;
      var zavieh3 = zavieh2 / zel;
      var result = zavieh3.toString() + ":اندازه هر زاویه داخلی";

      setState(() {
        _zavieh_d_count = result;
      });
    }
  }

  zavieh_kh(String z) {
    int zel = int.parse(z);

    var zakh1 = zel;
    var zakh2 = 360 / zakh1;

    var result = zakh2.toString() + ":اندازه هر زاویه خارجی";
    setState(() {
      _zavieh_kh_count = result;
    });
  }

  zavieh_m(String z) {
    int zel = int.parse(z);

    var zadama2 = zel - 2;
    var zadama3 = zadama2 * 180;
    var result = zadama3.toString() + ":مجموع زوایا";

    setState(() {
      _zavieh_m_count = result;
    });
  }
}
