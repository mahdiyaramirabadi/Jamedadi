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
                    top: MediaQuery.of(context).size.height / 40),
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
                          if (widget.id == "bh") {
                            mosalas_ertefa_ghaede_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (widget.id == "Rectangle" ||
                              widget.id == "Parallelogram") {
                            mostatil_motevaziazla_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (widget.id == "Kite") {
                            lozi_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (widget.id == "Circular-sector") {
                            ghetae_dayere_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (widget.id == "Ellipse") {
                            beyzi_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (widget.id == "cylinder") {
                            ostovane_mas(
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

  mosalas_ertefa_ghaede_mas(String B, String h) {
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
      var mosalas_ertefa_ghaede_mas_b = _B;
      var mosalas_ertefa_ghaede_mas_h = _h;
      var mosalas_ertefa_ghaede_mas_A =
          1 / 2 * mosalas_ertefa_ghaede_mas_b * mosalas_ertefa_ghaede_mas_h;
      set_result(mosalas_ertefa_ghaede_mas_A);
    } else {
      set_error_result();
    }
  }

  mostatil_motevaziazla_mas(String a, String b) {
    if (a != "" && b != "") {
      var _a;
      if (a.contains(".") == true) {
        _a = double.parse(a);
      } else if (a.contains(".") == false) {
        _a = int.parse(a);
      }
      var _b;
      if (b.contains(".") == true) {
        _b = double.parse(b);
      } else if (b.contains(".") == false) {
        _b = int.parse(b);
      }
      var mostatil_mas_a = _a;
      var mostatil_mas_b = _b;
      var mostatil_mas_A = mostatil_mas_a * mostatil_mas_b;
      set_result(mostatil_mas_A);
    } else {
      set_error_result();
    }
  }

  lozi_mas(String d, String e) {
    if (d != "" && e != "") {
      var _d;
      if (d.contains(".") == true) {
        _d = double.parse(d);
      } else if (d.contains(".") == false) {
        _d = int.parse(d);
      }
      var _e;
      if (e.contains(".") == true) {
        _e = double.parse(e);
      } else if (e.contains(".") == false) {
        _e = int.parse(e);
      }
      var lozi_mas_d = _d;
      var lozi_mas_e = _e;
      var lozi_mas_A = 1 / 2 * lozi_mas_d * lozi_mas_e;
      set_result(lozi_mas_A);
    } else {
      set_error_result();
    }
  }

  ghetae_dayere_mas(String r, String z) {
    if (r != "" && z != "") {
      double ghetae_dayere_mas_r = double.parse(r);
      double ghetae_dayere_mas_zaviye = double.parse(z);
      //zaviye bar hasb radian
      num ghetae_dayere_mas_A =
          1 / 2 * pow(ghetae_dayere_mas_r, 2) * ghetae_dayere_mas_zaviye;

      set_result(ghetae_dayere_mas_A);
    } else {
      set_error_result();
    }
  }

  beyzi_mas(String a, String b) {
    if (a != "" && b != "") {
      double beyzi_mas_a = double.parse(a);
      double beyzi_mas_b = double.parse(b);
      double beyzi_mas_A = beyzi_mas_a * beyzi_mas_b * pi;

      set_result(beyzi_mas_A);
    } else {
      set_error_result();
    }
  }

  ostovane_mas(String r, String h) {
    if (r != "" && h != "") {
      double ostovane_mas_r = double.parse(r);
      double ostovane_mas_h = double.parse(h);
      double ostovane_mas_kol_A =
          2 * pi * ostovane_mas_r * (ostovane_mas_r + ostovane_mas_h);
      double ostovane_mas_janebi_A = 2 * pi * ostovane_mas_r * ostovane_mas_h;

      set_result("مساحت کل: $ostovane_mas_kol_A");
    } else {
      set_error_result();
    }
  }
}
