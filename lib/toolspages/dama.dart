import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/appbar.dart';
import 'package:jamedadi/main.dart';
import 'package:jamedadi/t.dart';
import 'package:jamedadi/toolspages/adad.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:jamedadi/toolspages/dama%20modals/units1.dart';
import 'package:jamedadi/toolspages/dama%20modals/units2.dart';

class tabdil_dama extends StatefulWidget {
  @override
  _tabdil_damaState createState() => _tabdil_damaState();
}

class _tabdil_damaState extends State<tabdil_dama> {
  var numController = TextEditingController();
  String _result_convert = "...";
  List numbers = [];
  String _chosenValue = "";
  String zarib1_hint = "واحد فعلی";
  String zarib2_hint = "واحد خواسته شده";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: Toolsappbar(context, "تبدیل دما"),
      body: damaUI(),
    );
  }

  Widget damaUI() {
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
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,.,-]')),
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
                        builder: (context) => units1(),
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
                        builder: (context) => units2(),
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
        zarib1_hint != "واحد فعلی" &&
        zarib2_hint != "واحد خواسته شده") {
      var number;
      if (num.contains(".") == true) {
        number = double.parse(num);
      } else if (num.contains(".") == false) {
        number = int.parse(num);
      }
      var v1 = zarib_list1[1];
      var v2 = zarib_list2[1];

      if (v1 != v2) {
        if (v1 == "k") {
          if (v2 == "f") {
            var K_num = number;
            // k to f
            var k_f1 = 9 / 5;
            var k_f2 = K_num * k_f1;
            var k_f = k_f2 - 459.67;
            setState(() {
              _result_convert = k_f.toString();
            });
          } else if (v2 == "c") {
            var K_num = number;
            var k_c = K_num - 273.15;
            setState(() {
              _result_convert = k_c.toString();
            });
          }
        } else if (v1 == "f") {
          if (v2 == "k") {
            var f_num = number;
            //f to k
            var f_k1 = f_num + 459.67;
            var f_k2 = 5 / 9;
            var f_k = f_k1 * f_k2;
            setState(() {
              _result_convert = f_k.toString();
            });
          } else if (v2 == "c") {
            var f_num = number;
            //f to c
            var f_c1 = f_num - 32;
            var f_c2 = 5 / 9;
            var f_c = f_c1 * f_c2;
            setState(() {
              _result_convert = f_c.toString();
            });
          }
        } else if (v1 == "c") {
          if (v2 == "f") {
            var c_num = number;
            //c to f
            var c_f1 = 9 / 5;
            var c_f2 = c_num * c_f1;
            var c_f = c_f2 + 32;
            setState(() {
              _result_convert = c_f.toString();
            });
          } else if (v2 == "k") {
            var c_num = number;
            //c to k
            var c_k = c_num + 273.15;
            setState(() {
              _result_convert = c_k.toString();
            });
          }
        }
      } else if (v1 == v2) {
        setState(() {
          _result_convert = number.toString();
        });
      }
    } else {
      var result_list = [];
      if (num == "") {
        result_list.add("عدد");
      }
      if (zarib1_hint == "واحد فعلی" || zarib2_hint == "واحد خواسته شده") {
        result_list.add("واحد ها");
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
