import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';
import 'package:jamedadi/t.dart';
import 'package:jamedadi/toolspages/adad.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
import 'package:jamedadi/toolspages/vahed%20modals/listofunits_v1.dart';
import 'package:jamedadi/toolspages/vahed modals/listofunits_v2.dart';
import 'package:jamedadi/toolspages/vahed modals/listofzarib.dart';

class tabdil_vahed extends StatefulWidget {
  @override
  _tabdil_vahedState createState() => _tabdil_vahedState();
}

class _tabdil_vahedState extends State<tabdil_vahed> {
  var numController = TextEditingController();
  String _result_convert = "...";
  List numbers = [];
  String _chosenValue = "";
  String zarib1_hint = "پیشوند فعلی";
  String zarib2_hint = "پیشوند خواسته شده";
  String zarib_kol_hint = "ضریب کل";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "تبدیل واحد",
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: Icon(Icons.ios_share, color: Theme.of(context).accentColor),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Theme.of(context).accentColor,
              size: 25,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: vahedUI(),
    );
  }

  Widget vahedUI() {
    return Builder(
      builder: (context) => Stack(
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
                    keyboardType: TextInputType.datetime,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 12, 40, 12),
                      hintText: "عدد را وارد کنید",
                      hintStyle:
                          TextStyle(color: Theme.of(context).accentColor),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 15),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
                    ],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Vazir",
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Theme.of(context).accentColor,
                    ),
                    controller: numController,
                  ),
                ), //text field
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 16,
                  child: InkWell(
                    onTap: () async {
                      await showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => listofunits_v1(),
                        topRadius: Radius.circular(20),
                        elevation: 10,
                        duration: Duration(milliseconds: 950),
                        animationCurve: Curves.easeInOut,
                        barrierColor: Color.fromRGBO(0, 0, 0, .8),
                      );
                      setState(() {
                        zarib1_hint = zarib_list1[0];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).accentColor,
                          ),
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          zarib1_hint,
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 16,
                  child: InkWell(
                    onTap: () async {
                      await showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => listofunits_v2(),
                        topRadius: Radius.circular(20),
                        elevation: 10,
                        duration: Duration(milliseconds: 950),
                        animationCurve: Curves.easeInOut,
                        barrierColor: Color.fromRGBO(0, 0, 0, .8),
                      );
                      setState(() {
                        zarib2_hint = zarib_list2[0];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).accentColor,
                          ),
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          zarib2_hint,
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 16,
                  child: InkWell(
                    onTap: () async {
                      await showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => listofzarib(),
                        topRadius: Radius.circular(20),
                        elevation: 10,
                        duration: Duration(milliseconds: 950),
                        animationCurve: Curves.easeInOut,
                        barrierColor: Color.fromRGBO(0, 0, 0, .8),
                      );
                      setState(() {
                        zarib_kol_hint = zarib_kol_list[0];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).accentColor,
                          ),
                          color: Theme.of(context).primaryColor),
                      child: Center(
                        child: Text(
                          zarib_kol_hint,
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
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
                      try {
                        calculator(numController.text);
                      } on Exception {
                        calculator("");
                      }
                    },
                    child: Center(
                      child: Text(
                        "محاسبه",
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
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
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                    child: Center(
                      child: Text(
                        _result_convert,
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: MediaQuery.of(context).size.width / 18,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calculator(String num) {
    if (num != "" &&
        zarib1_hint != "پیشوند فعلی" &&
        zarib2_hint != "پیشوند خواسته شده" &&
        zarib_kol_hint != "ضریب کل") {
      var number;

      if (num.contains(".") == true) {
        number = double.parse(num);
      } else if (num.contains(".") == false) {
        number = int.parse(num);
      }

      var adad = number;
      int zarib_dade = zarib_list1[1];
      int zarib_khaste = zarib_list2[1];
      int tavan_kol = zarib_kol_list[1];

      print("zarib khaste : $zarib_khaste");
//tavan kol = te'dad parametr haye dakhil => masahat = m * m => tavan kol = 2
      if (zarib_dade == zarib_khaste) {
        setState(() {
          _result_convert = adad.toString();
        });
      } else if (zarib_dade != 11 && zarib_khaste != 11) {
        setState(() {
          int zarib_kol = zarib_dade + (-1 * zarib_khaste);
          int res_yeka = zarib_kol * tavan_kol;
          var result = adad * (pow(10, res_yeka));
          String text_result = adad.toString() +
              " ˟ 10 ^" +
              res_yeka.toString() +
              " = " +
              result.toString();
          _result_convert = text_result;
        });
      } else if (zarib_dade == 11) {
        setState(() {
          int zarib_kol = -1 * zarib_khaste;
          int res_yeka = zarib_kol * tavan_kol;
          var result = adad * (pow(10, res_yeka));
          String text_result = adad.toString() +
              " ˟ 10 ^" +
              res_yeka.toString() +
              " = " +
              result.toString();
          _result_convert = text_result;
        });
      } else if (zarib_khaste == 11) {
        setState(() {
          int zarib_kol = zarib_dade;
          int res_yeka = zarib_kol * tavan_kol;
          var result = adad * (pow(10, res_yeka));
          String text_result = adad.toString() +
              " ˟ 10 ^" +
              res_yeka.toString() +
              " = " +
              result.toString();
          _result_convert = text_result;
        });
      }
    } else {
      var result_list = [];
      if (num == "") {
        result_list.add("عدد");
      }
      if (zarib1_hint == "پیشوند فعلی" || zarib2_hint == "پیشوند خواسته شده") {
        result_list.add("پیشوند ها");
      }
      if (zarib_kol_hint == "ضریب کل") {
        result_list.add("ضریب");
      }

      setState(() {
        var result_str = "";
        print(result_list.length);
        if (result_list.length > 1) {
          var len = result_list.length - 1;
          for (var i = 0; i < len; i++) {
            result_list[i] += "،";
          }
        }
        print(result_list);

        for (var i in result_list) {
          result_str += i;
        }
        result_str += " را وارد کنید";
        _result_convert = result_str;
      });
    }
  }
}

Card generatorItems(List list, context) {
  return Card(
    color: Color.fromRGBO(237, 198, 165, 0.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 0,
    child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 5 * 2 + 30,
        width: MediaQuery.of(context).size.width / 10 * 7 + 20,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Color.fromRGBO(45, 76, 94, 1.0),
            height: 2,
            indent: 5.0,
            endIndent: 5.0,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${list[index]}',
                style: TextStyle(fontFamily: "Vazir"),
              ),
            );
          },
        )),
  );
}
