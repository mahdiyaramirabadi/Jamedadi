import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'mahlool modal/vahedmodal.dart';

class Mahlool extends StatefulWidget {
  @override
  _MahloolState createState() => _MahloolState();
}

class _MahloolState extends State<Mahlool> {
  var gController = TextEditingController();
  var s1Controller = TextEditingController();
  var s2Controller = TextEditingController();

  String _rosoob_count = "...";

  // =================================

  var halshController = TextEditingController();
  var halalController = TextEditingController();
  var vahed_hint = "واحد";
  String _ghelzat_count = "...";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "محلول",
              style: TextStyle(
                  fontFamily: "Vazir", color: Theme.of(context).primaryColor),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).accentColor,
            elevation: 0,
            leading: SizedBox(),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: false,
                    indicatorColor: Theme.of(context).primaryColor,
                    tabs: [
                      Tab(
                        child: Text(
                          "رسوب",
                          style: TextStyle(
                              fontFamily: "Vazir",
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "غلظت",
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
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "جرم",
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
                              controller: gController,
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
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "انحلال پذیری در دمای کمتر",
                                hintStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 15),
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
                              controller: s1Controller,
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
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "انحلال پذیری در دمای بیشتر",
                                hintStyle: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 15),
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
                              controller: s2Controller,
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
                                rosoob_calc(gController.text, s1Controller.text,
                                    s2Controller.text);
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
                                _rosoob_count,
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
                    )
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
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "حل شونده",
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
                              controller: halshController,
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
                              keyboardType: TextInputType.number,
                              cursorColor: Theme.of(context).cursorColor,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 20, 40, 20),
                                hintText: "حلال",
                                hintStyle: TextStyle(
                                  color: Theme.of(context).accentColor,
                                ),
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
                              controller: halalController,
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
                                  builder: (context) => vahedmodal(),
                                  topRadius: Radius.circular(20),
                                  elevation: 10,
                                  duration: Duration(milliseconds: 950),
                                  animationCurve: Curves.easeInOut,
                                  barrierColor: Color.fromRGBO(0, 0, 0, .8),
                                );
                                setState(() {
                                  vahed_hint = vahed_list[0];
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
                                    vahed_hint,
                                    style: TextStyle(
                                      fontFamily: "Vazir",
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                ),
                              ),
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
                                ghelzat(
                                    halshController.text, halalController.text);
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
                                _ghelzat_count,
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
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  rosoob_calc(String germ_e, String s1_e, String s2_e) {
    var germ;

    if (germ_e.contains(".") == true) {
      germ = double.parse(germ_e);
    } else if (germ_e.contains(".") == false) {
      germ = int.parse(germ_e);
    }
    var s1;

    if (s1_e.contains(".") == true) {
      s1 = double.parse(s1_e);
    } else if (s1_e.contains(".") == false) {
      s1 = int.parse(s1_e);
    }

    var s2;

    if (s2_e.contains(".") == true) {
      s2 = double.parse(s2_e);
    } else if (s2_e.contains(".") == false) {
      s2 = int.parse(s2_e);
    }

    var parantez = s2 - s1;
    var soorat = germ * parantez;
    var makhraj = 100 + s2;
    var rosub = soorat / makhraj;

    setState(() {
      _rosoob_count = rosub.toString();
    });
  }

  ghelzat(String halsh_e, String halal_e) {
    var halsh;

    if (halsh_e.contains(".") == true) {
      halsh = double.parse(halsh_e);
    } else if (halsh_e.contains(".") == false) {
      halsh = int.parse(halsh_e);
    }
    var halal;

    if (halal_e.contains(".") == true) {
      halal = double.parse(halal_e);
    } else if (halal_e.contains(".") == false) {
      halal = int.parse(halal_e);
    }

    if (vahed_list[1] == "darsad") {
      var ghelzat_darsad1 = halsh / halal;
      var ghelzat_darsad2 = ghelzat_darsad1 * 100;
      var result = ghelzat_darsad2.toString() + " %";
      setState(() {
        _ghelzat_count = result;
      });
    } else if (vahed_list[1] == "ppm") {
      var ghelzat_ppm1 = halsh / halal;
      var ghelzat_ppm2 = ghelzat_ppm1 * 1000000;
      var result = ghelzat_ppm2.toString() + " ppm";
      setState(() {
        _ghelzat_count = result;
      });
    }
  }

  // moghavemat(String v, String i) {
  //   var v_num;

  //   if (v.contains(".") == true) {
  //     v_num = double.parse(v);
  //     print("double");
  //   } else if (v.contains(".") == false) {
  //     v_num = int.parse(v);
  //     print("int");
  //   }
  //   var i_num;

  //   if (i.contains(".") == true) {
  //     i_num = double.parse(i);
  //   } else if (i.contains(".") == false) {
  //     i_num = int.parse(i);
  //   }

  //   var moghavemat_v = v_num;
  //   var moghavemat_i = i_num;
  //   var res_moghavemat = moghavemat_v / moghavemat_i;

  //   setState(() {
  //     _moghavemat_count = res_moghavemat.toString();
  //   });
  // }
}
// Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).backgroundColor,
//                 ),
//                 child: Positioned.fill(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width / 10,
//                         right: MediaQuery.of(context).size.width / 10,
//                         top: MediaQuery.of(context).size.height / 20),
//                     child: ListView(children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).primaryColor),
//                             child: Expanded(
//                               child: TextField(
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'[0-9,.]')),
//                                 ],
//                                 keyboardType: TextInputType.number,
//                                 cursorColor: Theme.of(context).cursorColor,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding:
//                                       EdgeInsets.fromLTRB(10, 20, 40, 20),
//                                   hintText: "جرم",
//                                   hintStyle: TextStyle(
//                                       color: Theme.of(context).accentColor),
//                                   icon: Padding(
//                                     padding: EdgeInsets.only(left: 15),
//                                     child: Icon(Icons.circle,
//                                         color: Theme.of(context).accentColor),
//                                   ),
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: "Vazir",
//                                   fontSize:
//                                       MediaQuery.of(context).size.width / 20,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 controller: gController,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 50,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).primaryColor),
//                             child: TextField(
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp(r'[0-9,.]')),
//                               ],
//                               keyboardType: TextInputType.number,
//                               cursorColor: Theme.of(context).cursorColor,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 contentPadding:
//                                     EdgeInsets.fromLTRB(10, 20, 40, 20),
//                                 hintText: "انحلال پذیری در دمای کمتر",
//                                 hintStyle: TextStyle(
//                                     color: Theme.of(context).accentColor,
//                                     fontSize: 16),
//                                 icon: Padding(
//                                   padding: EdgeInsets.only(left: 15),
//                                   child: Icon(Icons.circle,
//                                       color: Theme.of(context).accentColor),
//                                 ),
//                               ),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: "Vazir",
//                                 fontSize:
//                                     MediaQuery.of(context).size.width / 20,
//                                 color: Theme.of(context).accentColor,
//                               ),
//                               controller: s1Controller,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 50,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).primaryColor),
//                             child: TextField(
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp(r'[0-9,.]')),
//                               ],
//                               keyboardType: TextInputType.number,
//                               cursorColor: Theme.of(context).cursorColor,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 contentPadding:
//                                     EdgeInsets.fromLTRB(10, 20, 40, 20),
//                                 hintText: "انحلال پذیری در دمای بیشتر",
//                                 hintStyle: TextStyle(
//                                     color: Theme.of(context).accentColor,
//                                     fontSize: 16),
//                                 icon: Padding(
//                                   padding: EdgeInsets.only(left: 15),
//                                   child: Icon(Icons.circle,
//                                       color: Theme.of(context).accentColor),
//                                 ),
//                               ),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: "Vazir",
//                                 fontSize:
//                                     MediaQuery.of(context).size.width / 20,
//                                 color: Theme.of(context).accentColor,
//                               ),
//                               controller: s2Controller,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 22,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).accentColor),
//                             height: MediaQuery.of(context).size.height / 13,
//                             width: MediaQuery.of(context).size.width,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(40),
//                               onTap: () {
//                                 rosoob_calc(gController.text, s1Controller.text,
//                                     s2Controller.text);
//                               },
//                               child: Center(
//                                 child: Text(
//                                   "محاسبه",
//                                   style: TextStyle(
//                                     fontFamily: "Vazir",
//                                     fontSize:
//                                         MediaQuery.of(context).size.width / 20,
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 20,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).backgroundColor),
//                             height: MediaQuery.of(context).size.height / 10,
//                             width: MediaQuery.of(context).size.width,
//                             child: Center(
//                               child: Text(
//                                 _rosoob_count,
//                                 style: TextStyle(
//                                   fontFamily: "Vazir",
//                                   fontSize:
//                                       MediaQuery.of(context).size.width / 18,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]),
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).backgroundColor,
//                 ),
//                 child: Positioned.fill(
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width / 10,
//                         right: MediaQuery.of(context).size.width / 10,
//                         top: MediaQuery.of(context).size.height / 20),
//                     child: ListView(children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).primaryColor),
//                             child: Expanded(
//                               child: TextField(
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'[0-9,.]')),
//                                 ],
//                                 keyboardType: TextInputType.number,
//                                 cursorColor: Theme.of(context).cursorColor,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   contentPadding:
//                                       EdgeInsets.fromLTRB(10, 20, 40, 20),
//                                   hintText: "حل شونده",
//                                   hintStyle: TextStyle(
//                                       color: Theme.of(context).accentColor),
//                                   icon: Padding(
//                                     padding: EdgeInsets.only(left: 15),
//                                     child: Icon(Icons.circle,
//                                         color: Theme.of(context).accentColor),
//                                   ),
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: "Vazir",
//                                   fontSize:
//                                       MediaQuery.of(context).size.width / 20,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 controller: halshController,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 50,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).primaryColor),
//                             child: TextField(
//                               inputFormatters: [
//                                 FilteringTextInputFormatter.allow(
//                                     RegExp(r'[0-9,.]')),
//                               ],
//                               keyboardType: TextInputType.number,
//                               cursorColor: Theme.of(context).cursorColor,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 contentPadding:
//                                     EdgeInsets.fromLTRB(10, 20, 40, 20),
//                                 hintText: "حلال",
//                                 hintStyle: TextStyle(
//                                     color: Theme.of(context).accentColor,
//                                     fontSize: 16),
//                                 icon: Padding(
//                                   padding: EdgeInsets.only(left: 15),
//                                   child: Icon(Icons.circle,
//                                       color: Theme.of(context).accentColor),
//                                 ),
//                               ),
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: "Vazir",
//                                 fontSize:
//                                     MediaQuery.of(context).size.width / 20,
//                                 color: Theme.of(context).accentColor,
//                               ),
//                               controller: halalController,
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 50,
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: MediaQuery.of(context).size.height / 16,
//                             child: InkWell(
//                               onTap: () async {
//                                 await showCupertinoModalBottomSheet(
//                                   expand: false,
//                                   context: context,
//                                   backgroundColor: Colors.transparent,
//                                   builder: (context) => vahedmodal(),
//                                   topRadius: Radius.circular(20),
//                                   elevation: 10,
//                                   duration: Duration(milliseconds: 950),
//                                   animationCurve: Curves.easeInOut,
//                                   barrierColor: Color.fromRGBO(0, 0, 0, .8),
//                                 );
//                                 setState(() {
//                                   vahed_hint = vahed_list[0];
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(15),
//                                     border: Border.all(
//                                       width: 2.0,
//                                       color: Theme.of(context).accentColor,
//                                     ),
//                                     color: Theme.of(context).primaryColor),
//                                 child: Center(
//                                   child: Text(
//                                     vahed_hint,
//                                     style: TextStyle(
//                                       fontFamily: "Vazir",
//                                       fontSize:
//                                           MediaQuery.of(context).size.width /
//                                               20,
//                                       color: Theme.of(context).accentColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 22,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).accentColor),
//                             height: MediaQuery.of(context).size.height / 13,
//                             width: MediaQuery.of(context).size.width,
//                             child: InkWell(
//                               borderRadius: BorderRadius.circular(40),
//                               onTap: () {
//                                 ghelzat(
//                                     halshController.text, halalController.text);
//                               },
//                               child: Center(
//                                 child: Text(
//                                   "محاسبه",
//                                   style: TextStyle(
//                                     fontFamily: "Vazir",
//                                     fontSize:
//                                         MediaQuery.of(context).size.width / 20,
//                                     color: Theme.of(context).primaryColor,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: MediaQuery.of(context).size.height / 20,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                   width: 2.0,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                                 color: Theme.of(context).backgroundColor),
//                             height: MediaQuery.of(context).size.height / 10,
//                             width: MediaQuery.of(context).size.width,
//                             child: Center(
//                               child: Text(
//                                 _ghelzat_count,
//                                 style: TextStyle(
//                                   fontFamily: "Vazir",
//                                   fontSize:
//                                       MediaQuery.of(context).size.width / 18,
//                                   color: Theme.of(context).accentColor,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]),
//                   ),
//                 ),
//               ),
