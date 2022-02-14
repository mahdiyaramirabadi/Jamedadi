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
                      if (widget.id == "a") {
                        mosalas_motesavi_mas(valueController.text);
                      } else if (widget.id == "hexagon") {
                        zeli6_montazam_mas(valueController.text);
                      } else if (widget.id == "octagon") {
                        zeli8_montazam_mas(valueController.text);
                      } else if (widget.id == "Circle") {
                        dayere_mas(valueController.text);
                      } else if (widget.id == "Sphere") {
                        kore_mas(valueController.text);
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

  void set_result(result) {
    setState(() {
      _result = result.toString();
    });
  }

  void set_error_result() {
    setState(() {
      _result = "لطفا مقادیر را وارد کنید";
    });
  }

  mosalas_motesavi_mas(String a) {
    if (a != "") {
      var _a;
      if (a.contains(".") == true) {
        _a = double.parse(a);
      } else if (a.contains(".") == false) {
        _a = int.parse(a);
      }
      var mosalas_motesavi_mas_s = _a;
      var mosalas_motesavi_mas_s2 = pow(mosalas_motesavi_mas_s, 2);
      var mosalas_motesavi_mas_A = 1 / 4 * sqrt(3) * mosalas_motesavi_mas_s2;
      set_result(mosalas_motesavi_mas_A);
    } else {
      set_error_result();
    }
  }

  zeli6_montazam_mas(String a) {
    if (a != "") {
      double zeli6_montazam_mas_s = double.parse(a);
      num zeli6_montazam_mas_s2 = pow(zeli6_montazam_mas_s, 2);
      double zeli6_montazam_mas_A = 3 / 2 * sqrt(3) * zeli6_montazam_mas_s2;
      set_result(zeli6_montazam_mas_A);
    } else {
      set_error_result();
    }
  }

  zeli8_montazam_mas(String a) {
    if (a != "") {
      double zeli8_montazam_mas_a = double.parse(a);
      double zeli8_montazam_mas_s2 =
          zeli8_montazam_mas_a * zeli8_montazam_mas_a;
      double zeli8_montazam_mas_A = 2 * (1 + sqrt(2)) * zeli8_montazam_mas_s2;
      set_result(zeli8_montazam_mas_A);
    } else {
      set_error_result();
    }
  }

  dayere_mas(String r) {
    if (r != "") {
      double dayere_mas_r = double.parse(r);
      num dayere_mas_A = pi * pow(dayere_mas_r, 2);
      set_result(dayere_mas_A);
    } else {
      set_error_result();
    }
  }

  kore_mas(String r) {
    if (r != "") {
      double kore_mas_d = double.parse(r);
      double kore_mas_d2 = kore_mas_d * kore_mas_d;
      double kore_mas_A = 4 * pi * kore_mas_d2;
      set_result(kore_mas_A);
    } else {
      set_error_result();
    }
  }
}
