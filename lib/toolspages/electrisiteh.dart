import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';

class Electrisiteh extends StatefulWidget {
  @override
  _ElectrisitehState createState() => _ElectrisitehState();
}

class _ElectrisitehState extends State<Electrisiteh> {
  var rController_v = TextEditingController();
  var iController_v = TextEditingController();
  String _volt_count = "...";

  // =================================

  var rController_i = TextEditingController();
  var vController_i = TextEditingController();
  String _amper_count = "...";

  // ===================================

  var iController_r = TextEditingController();
  var vController_r = TextEditingController();
  String _moghavemat_count = "...";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "الکترسیته",
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
                          "ولت(اختلاف پتانسیل)",
                          style: TextStyle(
                              fontFamily: "Vazir",
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "آمپر(شدت جریان)",
                          style: TextStyle(
                              fontFamily: "Vazir",
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "مقاومت الکتریکی",
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width / 10,
                            top: MediaQuery.of(context).size.height / 20),
                        child: ListView(children: [
                          Column(
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
                                child: Expanded(
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9,.]')),
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 20, 40, 20),
                                      hintText: "شدت جریان الکتریکی(آمپر)",
                                      hintStyle: TextStyle(
                                          color: Theme.of(context).accentColor),
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(Icons.circle,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    controller: rController_v,
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
                                    color: Theme.of(context).primaryColor),
                                child: TextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9,.]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 20, 40, 20),
                                    hintText: "مقاومت الکتریکی",
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
                                  controller: iController_v,
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
                                width: MediaQuery.of(context).size.width,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () {
                                    volt(
                                        rController_v.text, iController_v.text);
                                  },
                                  child: Center(
                                    child: Text(
                                      "محاسبه",
                                      style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
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
                                    _volt_count,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width / 10,
                            top: MediaQuery.of(context).size.height / 20),
                        child: ListView(children: [
                          Column(
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
                                child: Expanded(
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9,.]')),
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 20, 40, 20),
                                      hintText: "ولت(اختلاف پتانسیل الکتریکی)",
                                      hintStyle: TextStyle(
                                          color: Theme.of(context).accentColor),
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(Icons.circle,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    controller: vController_i,
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
                                    color: Theme.of(context).primaryColor),
                                child: TextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9,.]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 20, 40, 20),
                                    hintText: "مقاومت الکتریکی",
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
                                  controller: rController_i,
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
                                width: MediaQuery.of(context).size.width,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () {
                                    amper(
                                        rController_i.text, vController_i.text);
                                  },
                                  child: Center(
                                    child: Text(
                                      "محاسبه",
                                      style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
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
                                    _amper_count,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 10,
                            right: MediaQuery.of(context).size.width / 10,
                            top: MediaQuery.of(context).size.height / 20),
                        child: ListView(children: [
                          Column(
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
                                child: Expanded(
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9,.]')),
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 20, 40, 20),
                                      hintText: "ولت(اختلاف پتانسیل الکتریکی)",
                                      hintStyle: TextStyle(
                                          color: Theme.of(context).accentColor),
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Icon(Icons.circle,
                                            color:
                                                Theme.of(context).accentColor),
                                      ),
                                    ),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    controller: vController_r,
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
                                    color: Theme.of(context).primaryColor),
                                child: TextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9,.]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 20, 40, 20),
                                    hintText: "آمپر(شدت جریان)",
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
                                  controller: iController_r,
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
                                width: MediaQuery.of(context).size.width,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () {
                                    moghavemat(
                                        vController_r.text, iController_r.text);
                                  },
                                  child: Center(
                                    child: Text(
                                      "محاسبه",
                                      style: TextStyle(
                                        fontFamily: "Vazir",
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20,
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
                                    _moghavemat_count,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              18,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  volt(String r, String i) {
    var r_num;

    if (r.contains(".") == true) {
      r_num = double.parse(r);
    } else if (r.contains(".") == false) {
      r_num = int.parse(r);
    }
    var i_num;

    if (i.contains(".") == true) {
      i_num = double.parse(i);
    } else if (i.contains(".") == false) {
      i_num = int.parse(i);
    }
    var volt_r = r_num;
    var volt_i = i_num;
    var res_volt = volt_r * volt_i;
    setState(() {
      _volt_count = res_volt.toString();
    });
  }

  amper(String r, String v) {
    var r_num;

    if (r.contains(".") == true) {
      r_num = double.parse(r);
      print("double");
    } else if (r.contains(".") == false) {
      r_num = int.parse(r);
      print("int");
    }
    var v_num;

    if (v.contains(".") == true) {
      v_num = double.parse(v);
    } else if (v.contains(".") == false) {
      v_num = int.parse(v);
    }

    var amper_v = v_num;
    var amper_r = r_num;
    var res_amper = amper_v / amper_r;

    setState(() {
      _amper_count = res_amper.toString();
    });
  }

  moghavemat(String v, String i) {
    var v_num;

    if (v.contains(".") == true) {
      v_num = double.parse(v);
      print("double");
    } else if (v.contains(".") == false) {
      v_num = int.parse(v);
      print("int");
    }
    var i_num;

    if (i.contains(".") == true) {
      i_num = double.parse(i);
    } else if (i.contains(".") == false) {
      i_num = int.parse(i);
    }

    var moghavemat_v = v_num;
    var moghavemat_i = i_num;
    var res_moghavemat = moghavemat_v / moghavemat_i;

    setState(() {
      _moghavemat_count = res_moghavemat.toString();
    });
  }
}
