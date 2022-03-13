import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/appbar.dart';
import 'package:jamedadi/main.dart';
import 'package:jamedadi/toolspages/fisaghores%20modals/fisaghoresmodals.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Fisa extends StatefulWidget {
  @override
  _FisaState createState() => _FisaState();
}

class _FisaState extends State<Fisa> {
  var z1Controller = TextEditingController();
  var z2Controller = TextEditingController();
  String _fisa_count = ":وتر";
  String _fisa_count_btntxt = "وتر";
  String target_hint = "هدف";
  String side_hint = "ضلع یک";
  String side_hint2 = "ضلع دو";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: Toolsappbar(context, "فیثاغورث",
          """با کـلـیـک روی هـدف،ضـلـع هـدفـی که مـیـخواهید محـاسبه شـود را انتـخاب کنید
حال اندازه اضلاع خواسته شده  را وارد کنید و روی محاسبه کلیک کنید"""),
      body: FisaUI(),
    );
  }

  Widget FisaUI() {
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
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 16,
                  child: InkWell(
                    onTap: () async {
                      await showCupertinoModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => sidetype(),
                        topRadius: Radius.circular(20),
                        elevation: 10,
                        duration: Duration(milliseconds: 500),
                        animationCurve: Curves.easeInOut,
                        barrierColor: Color.fromRGBO(0, 0, 0, .8),
                      );
                      setState(() {
                        target_hint = sidetype_list[0];
                        if (sidetype_list[1] == 1) {
                          side_hint = "ضلع یک";
                          side_hint2 = "ضلع دو";
                          _fisa_count = ":وتر";
                          _fisa_count_btntxt = "وتر";
                        } else if (sidetype_list[1] == 2) {
                          side_hint = "وتر";
                          side_hint2 = "ضلع یک";

                          _fisa_count = ":ضلع";
                          _fisa_count_btntxt = "ضلع";
                        }
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
                          target_hint,
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
                //text field
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
                      color: Theme.of(context).primaryColor),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      hintText: side_hint,
                      hintStyle:
                          TextStyle(color: Theme.of(context).accentColor),
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
                    controller: z1Controller,
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
                      color: Theme.of(context).primaryColor),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,.]')),
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      hintText: side_hint2,
                      hintStyle:
                          TextStyle(color: Theme.of(context).accentColor),
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
                    controller: z2Controller,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 22,
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
                  child: InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {
                      calculator(z1Controller.text, z2Controller.text);
                    },
                    child: Center(
                      child: Text(
                        "محاسبه $_fisa_count_btntxt",
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
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Theme.of(context).backgroundColor),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      _fisa_count,
                      style: TextStyle(
                        fontFamily: "Vazir",
                        fontSize: MediaQuery.of(context).size.width / 18,
                        color: Theme.of(context).hintColor,
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

  void calculator(String z1, String z2) {
    if (z1 != "" && z2 != "" && target_hint != "هدف") {
      var number1;
      if (z1.contains(".") == true) {
        number1 = double.parse(z1);
      } else if (z1.contains(".") == false) {
        number1 = int.parse(z1);
      }
      var number2;
      if (z2.contains(".") == true) {
        number2 = double.parse(z2);
      } else if (z2.contains(".") == false) {
        number2 = int.parse(z2);
      }
      setState(() {
        String a = "";
        if (sidetype_list[1] == 1) {
          var ze1 = number1;
          var ze2 = number2;
          var ze11 = ze1 * ze1;
          var ze22 = ze2 * ze2;
          var ze12 = ze11 + ze22;
          var finalz;
          finalz = sqrt(ze12);
          a = finalz.toString();
        } else if (sidetype_list[1] == 2) {
          var ze1 = number1;
          var ze2 = number2;
          var ze11 = ze1 * ze1;
          var ze22 = ze2 * ze2;
          var ze12 = ze11 - ze22;
          var finalz;
          finalz = sqrt(ze12);
          a = finalz.toString();
        }

        _fisa_count = a;
      });
    } else {
      List error_list = [];
      if (z1 == "" || z2 == "") {
        error_list.add("اندازه اضلاع");
      }
      if (target_hint == "هدف") {
        error_list.add("ضلع هدف");
      }

      setState(() {
        var result_str = "";
        print(error_list.length);
        if (error_list.length > 1) {
          var len = error_list.length - 1;
          for (var i = 0; i < len; i++) {
            error_list[i] += " و ";
          }
        }
        print(error_list);

        for (var i in error_list) {
          result_str += i;
        }
        result_str += " را وارد کنید";
        _fisa_count = result_str;
      });
    }
  }
}
