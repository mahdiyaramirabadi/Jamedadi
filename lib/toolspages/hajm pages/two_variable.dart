import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Twovar extends StatefulWidget {
  final String title;
  final String id;
  final String img_url;
  final String formula;
  final List textfield_hint;

  const Twovar(
      {Key? key,
      required this.title,
      required this.img_url,
      required this.formula,
      required this.textfield_hint,
      required this.id})
      : super(key: key);

  @override
  _TwovarState createState() => _TwovarState();
}

class _TwovarState extends State<Twovar> {
  var value1Controller = TextEditingController();
  var value2Controller = TextEditingController();
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
                      hintText: widget.textfield_hint[0],
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
                    controller: value1Controller,
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
                      color: Theme.of(context).primaryColor),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      hintText: widget.textfield_hint[1],
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
                    controller: value2Controller,
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
                      if (widget.id == "Prism") {
                        Prism_hajm(
                            value1Controller.text, value2Controller.text);
                      } else if (widget.id == "Pyramid") {
                        Pyramid_hajm(
                            value1Controller.text, value2Controller.text);
                      } else if (widget.id == "Circular-Cylinder") {
                        Circular_Cylinder_hajm(
                            value1Controller.text, value2Controller.text);
                      } else if (widget.id == "Cone") {
                        Cone_hajm(value1Controller.text, value2Controller.text);
                      } else if (widget.id == "Solid-torus") {
                        Solid_torus_hajm(
                            value1Controller.text, value2Controller.text);
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

  Pyramid_hajm(String B, String h) {
    if (B != "" && h != "") {
      var _B;
      if (B.contains(".") == true) {
        _B = double.parse(B);
      } else if (B.contains(".") == false) {
        _B = int.parse(B);
      }
      var _h;
      if (h.contains(".") == true) {
        _h = double.parse(h);
      } else if (h.contains(".") == false) {
        _h = int.parse(h);
      }
      var heram_hajm_B = _B;
      //B= masahate ghaede
      var heram_hajm_h = _h;
      var heram_hajm_V = 1 / 3 * heram_hajm_B * heram_hajm_h;
      setState(() {
        _result = heram_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  Circular_Cylinder_hajm(String r, String h) {
    if (r != "" && h != "") {
      var _r;
      if (r.contains(".") == true) {
        _r = double.parse(r);
      } else if (r.contains(".") == false) {
        _r = int.parse(r);
      }
      var _h;
      if (h.contains(".") == true) {
        _h = double.parse(h);
      } else if (h.contains(".") == false) {
        _h = int.parse(h);
      }
      var ostovane_hajm_pi = pi;
      var ostovane_hajm_r = _r;
      var ostovane_hajm_r2 = ostovane_hajm_r * ostovane_hajm_r;
      var ostovane_hajm_h = _h;
      var ostovane_V = ostovane_hajm_pi * ostovane_hajm_r2 * ostovane_hajm_h;

      setState(() {
        _result = ostovane_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  Prism_hajm(String B, String h) {
    if (B != "" && h != "") {
      var _B;
      if (B.contains(".") == true) {
        _B = double.parse(B);
      } else if (B.contains(".") == false) {
        _B = int.parse(B);
      }
      var _h;
      if (h.contains(".") == true) {
        _h = double.parse(h);
      } else if (h.contains(".") == false) {
        _h = int.parse(h);
      }
      var manshoor_hajm_B = _B;
      var manshoor_hajm_h = _h;
      var manshoor_hajm_V = manshoor_hajm_B * manshoor_hajm_h;

      setState(() {
        _result = manshoor_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  Cone_hajm(String r, String h) {
    if (r != "" && h != "") {
      var _r;
      if (r.contains(".") == true) {
        _r = double.parse(r);
      } else if (r.contains(".") == false) {
        _r = int.parse(r);
      }
      var _h;
      if (h.contains(".") == true) {
        _h = double.parse(h);
      } else if (h.contains(".") == false) {
        _h = int.parse(h);
      }
      var makhroot_hajm_pi = pi;
      var makhroot_hajm_r = _r;
      var makhroot_hajm_r2 = makhroot_hajm_r * makhroot_hajm_r;
      var makhroot_hajm_h = _h;
      var makhroot_hajm_V =
          1 / 3 * makhroot_hajm_pi * makhroot_hajm_r2 * makhroot_hajm_h;

      setState(() {
        _result = makhroot_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  Solid_torus_hajm(String r, String R) {
    if (R != "" && r != "") {
      var _r;
      if (r.contains(".") == true) {
        _r = double.parse(r);
      } else if (r.contains(".") == false) {
        _r = int.parse(r);
      }
      var _R;
      if (R.contains(".") == true) {
        _R = double.parse(R);
      } else if (R.contains(".") == false) {
        _R = int.parse(R);
      }
      var chanbare_hajm_R = _R;
      var chanbare_hajm_r = _r;
      var chanbare_hajm_r2 = chanbare_hajm_r * chanbare_hajm_r;
      var chanbare_hajm_pi = pi;
      var chanbare_hajm_pi2 = chanbare_hajm_pi * chanbare_hajm_pi;
      var chanbare_hajm_V =
          2 * chanbare_hajm_pi2 * chanbare_hajm_R * chanbare_hajm_r2;

      setState(() {
        _result = chanbare_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }
}
