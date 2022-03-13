import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Threevar extends StatefulWidget {
  final String title;
  final String id;
  final String img_url;
  final String formula;
  final List textfield_hint;

  const Threevar(
      {Key? key,
      required this.title,
      required this.img_url,
      required this.formula,
      required this.textfield_hint,
      required this.id})
      : super(key: key);

  @override
  _ThreevarState createState() => _ThreevarState();
}

class _ThreevarState extends State<Threevar> {
  var value1Controller = TextEditingController();
  var value2Controller = TextEditingController();
  var value3Controller = TextEditingController();
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
      body: BodyUI(),
    );
  }

  Widget BodyUI() {
    return Builder(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                    top: MediaQuery.of(context).size.height / 20,
                    bottom: MediaQuery.of(context).size.height / 20),
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
                          color: Theme.of(context).primaryColor),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                          hintText: widget.textfield_hint[2],
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
                        controller: value3Controller,
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
                          if (widget.id == "s-abc") {
                            mosalas_mohit_va_zel_mas(value1Controller.text,
                                value2Controller.text, value3Controller.text);
                          } else if (widget.id == "ab-y") {
                            mosalas_do_zel_va_zaviye_mas(value1Controller.text,
                                value2Controller.text, value3Controller.text);
                          } else if (widget.id == "Trapezoid") {
                            zooznanghe_mas(value1Controller.text,
                                value2Controller.text, value3Controller.text);
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
                            )),
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
                    TeXView(
                      fonts: [
                        TeXViewFont(
                            fontFamily: 'Vazir', src: 'fonts/vazir.ttf'),
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
                  ],
                ),
              ),
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

  mosalas_mohit_va_zel_mas(String a, String b, String c) {
    if (a != "" && b != "" && c != "") {
      var _a;
      if (a.contains(".") == true) {
        _a = double.parse(a);
      } else if (a.contains(".") == false) {
        _a = int.parse(a);
      }

      var _b;
      if (b.contains(".") == true) {
        _b = double.parse(b);
      } else if (a.contains(".") == false) {
        _b = int.parse(b);
      }
      var _c;
      if (c.contains(".") == true) {
        _c = double.parse(c);
      } else if (a.contains(".") == false) {
        _c = int.parse(c);
      }
      var mosalas_mohit_va_zel_mas_s = _a + _b + _c;
      var mosalas_mohit_va_zel_mas_a = _a;
      var mosalas_mohit_va_zel_mas_b = _b;
      var mosalas_mohit_va_zel_mas_c = _c;
      var mosalas_mohit_va_zel_mas_ebarat = mosalas_mohit_va_zel_mas_s *
          (mosalas_mohit_va_zel_mas_s - mosalas_mohit_va_zel_mas_a) *
          (mosalas_mohit_va_zel_mas_s - mosalas_mohit_va_zel_mas_b) *
          (mosalas_mohit_va_zel_mas_s - mosalas_mohit_va_zel_mas_c);
      var mosalas_mohit_va_zel_mas_A = sqrt(mosalas_mohit_va_zel_mas_ebarat);

      set_result(mosalas_mohit_va_zel_mas_A);
    } else {
      set_error_result();
    }
  }

  mosalas_do_zel_va_zaviye_mas(String a, String b, String y) {
    if (a != "" && b != "" && y != "") {
      double mosalas_do_zel_va_zaviye_mas_a = double.parse(a);
      double mosalas_do_zel_va_zaviye_mas_b = double.parse(b);
      double mosalas_do_zel_va_zaviye_mas_C = double.parse(y);
      double mosalas_do_zel_va_zaviye_mas_rad_C =
          mosalas_do_zel_va_zaviye_mas_C * pi / 180;
      double mosalas_do_zel_va_zaviye_mas_C_sin =
          sin(mosalas_do_zel_va_zaviye_mas_rad_C);
      double mosalas_do_zel_va_zaviye_mas_A = 1 /
          2 *
          mosalas_do_zel_va_zaviye_mas_a *
          mosalas_do_zel_va_zaviye_mas_b *
          mosalas_do_zel_va_zaviye_mas_C_sin;
      set_result(mosalas_do_zel_va_zaviye_mas_A);
    } else {
      set_error_result();
    }
  }

  zooznanghe_mas(String a, String c, String h) {
    if (a != "" && c != "" && h != "") {
      double zooznanghe_mas_a = double.parse(a);
      double zooznanghe_mas_c = double.parse(c);
      double zooznanghe_mas_h = double.parse(h);
      double zooznanghe_mas_A =
          1 / 2 * (zooznanghe_mas_a + zooznanghe_mas_c) * zooznanghe_mas_h;
      set_result(zooznanghe_mas_A);
    } else {
      set_error_result();
    }
  }
}
