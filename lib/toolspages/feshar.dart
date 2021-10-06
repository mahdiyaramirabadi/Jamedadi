import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';

class Feshar extends StatefulWidget {
  @override
  _FesharState createState() => _FesharState();
}

class _FesharState extends State<Feshar> {
  var nirooController = TextEditingController();
  var sathController = TextEditingController();
  String _feshar_count = "...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "فشار",
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
                      hintText: "نیرو(نیوتون)",
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
                    controller: nirooController,
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
                        hintText: "سطح فشار(متر مربع)",
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
                      controller: sathController),
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
                      calculator(nirooController.text, sathController.text);
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
                      _feshar_count,
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
    var niroo;
    if (z1.contains(".") == true) {
      niroo = double.parse(z1);
    } else if (z1.contains(".") == false) {
      niroo = int.parse(z1);
    }
    var sath;
    if (z2.contains(".") == true) {
      sath = double.parse(z2);
    } else if (z2.contains(".") == false) {
      sath = int.parse(z2);
    }
    setState(() {
      var niroo_feshar = niroo;
      var sath_feshar = sath;
      var feshar_feshar = niroo_feshar / sath_feshar;
      var result = feshar_feshar.toString() + "Pa";

      _feshar_count = result;
    });
  }
}
