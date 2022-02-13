import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Onevar extends StatefulWidget {
  final String title;
  final String id;
  final String img_url;
  final String formula;
  final String textfield_hint;

  const Onevar(
      {Key? key,
      required this.title,
      required this.img_url,
      required this.formula,
      required this.textfield_hint,
      required this.id})
      : super(key: key);

  @override
  _OnevarState createState() => _OnevarState();
}

class _OnevarState extends State<Onevar> {
  var valueController = TextEditingController();
  String _result = "...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: SizedBox(),
      ),
      body: GhotrUI(),
    );
  }

  Widget GhotrUI() {
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
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      hintText: widget.textfield_hint,
                      hintStyle:
                          TextStyle(color: Theme.of(context).accentColor),
                      icon: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(Icons.linear_scale,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Vazir",
                      fontSize: MediaQuery.of(context).size.width / 20,
                      color: Theme.of(context).accentColor,
                    ),
                    controller: valueController,
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
                    onTap: () {
                      if (widget.id == "Cube") {
                        Cube_hajm(valueController.text);
                      } else if (widget.id == "Sphere") {
                        Sphere_hajm(valueController.text);
                      } else if (widget.id == "Tetrahedron") {
                        Tetrahedron_hajm(valueController.text);
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
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Theme.of(context).backgroundColor),
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(_result,
                        style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 18,
                            color: Theme.of(context).hintColor,
                            decoration: TextDecoration.underline)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: widget.img_url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: Theme.of(context).accentColor,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Expanded(
                  child: TeXView(
                    fonts: [
                      TeXViewFont(fontFamily: 'Vazir', src: 'fonts/vazir.ttf'),
                    ],
                    child: TeXViewContainer(
                      child: TeXViewDocument(widget.formula,
                          style: TeXViewStyle(
                              backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                              textAlign: TeXViewTextAlign.Center,
                              fontStyle:
                                  TeXViewFontStyle(fontFamily: "Vazir"))),
                      style: TeXViewStyle(
                          backgroundColor: Theme.of(context).backgroundColor),
                    ),
                    style: TeXViewStyle(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Sphere_hajm(String r) {
    if (r != "") {
      var _r;
      if (r.contains(".") == true) {
        _r = double.parse(r);
      } else if (r.contains(".") == false) {
        _r = int.parse(r);
      }
      var kore_hajm_r = _r;
      var kore_hajm_pi = pi;
      var kore_hajm_r3 = kore_hajm_r * kore_hajm_r * kore_hajm_r;
      var kore_hajm_V = 4 / 3 * kore_hajm_pi * kore_hajm_r3;
      setState(() {
        _result = kore_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  Cube_hajm(String a) {
    if (a != "") {
      var _a;
      if (a.contains(".") == true) {
        _a = double.parse(a);
      } else if (a.contains(".") == false) {
        _a = int.parse(a);
      }
      var mokab_hajm_a = _a;
      var mokab_hajm_V = mokab_hajm_a * mokab_hajm_a * mokab_hajm_a;
      setState(() {
        _result = mokab_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  Tetrahedron_hajm(String a) {
    if (a != "") {
      var _a;
      if (a.contains(".") == true) {
        _a = double.parse(a);
      } else if (a.contains(".") == false) {
        _a = int.parse(a);
      }
      var charavajhi_hajm_a = _a;
      var charavajhi_hajm_a3 =
          charavajhi_hajm_a * charavajhi_hajm_a * charavajhi_hajm_a;
      var charavajhi_hajm_radical2 = sqrt(2);
      var charavajhi_hajm_1 = charavajhi_hajm_radical2 / 12;
      var charavajhi_hajm_V = charavajhi_hajm_1 * charavajhi_hajm_a3;
      setState(() {
        _result = charavajhi_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }
}
