import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class shapePage extends StatefulWidget {
  final String title;
  final String id;
  final String img_url;
  final String formula;
  final List textfield_hint;

  const shapePage(
      {Key? key,
      required this.title,
      required this.img_url,
      required this.formula,
      required this.textfield_hint,
      required this.id})
      : super(key: key);

  @override
  _shapePageState createState() => _shapePageState();
}

class _shapePageState extends State<shapePage> {
  var value1Controller = TextEditingController();
  var value2Controller = TextEditingController();
  var masahat_kolController = TextEditingController();
  var masahat_janebiController = TextEditingController();

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
                  top: MediaQuery.of(context).size.height / 40,
                  bottom: MediaQuery.of(context).size.height / 40,
                ),
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
                          if (widget.id == "cylinder") {
                            ostovane_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (widget.id == "Cone") {
                            makhroot_mas(
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
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                          cursorColor: Theme.of(context).cursorColor,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                  color: Theme.of(context).accentColor,
                                  width: 2.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0)),
                            labelText: "مساحت کل",
                            labelStyle:
                                TextStyle(color: Theme.of(context).accentColor),
                            alignLabelWithHint: true,
                            enabled: false,
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).accentColor,
                          ),
                          controller: masahat_kolController),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextField(
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 2.0),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0)),
                          labelText: "مساحت جانبی",
                          labelStyle:
                              TextStyle(color: Theme.of(context).accentColor),
                          alignLabelWithHint: true,
                          enabled: false,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Vazir",
                          fontSize: MediaQuery.of(context).size.width / 20,
                          color: Theme.of(context).accentColor,
                        ),
                        controller: masahat_janebiController,
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

  void set_result(kol, janebi) {
    setState(() {
      String _kol = kol.toString();
      String _janebi = janebi.toString();
      masahat_kolController = TextEditingController(text: _kol);
      masahat_janebiController = TextEditingController(text: _janebi);
    });
  }

  void set_error_result() {
    setState(() {
      _result = "لطفا مقادیر را وارد کنید";
    });
  }

  ostovane_mas(String r, String h) {
    if (r != "" && h != "") {
      double ostovane_mas_r = double.parse(r);
      double ostovane_mas_h = double.parse(h);
      double ostovane_mas_kol_A =
          2 * pi * ostovane_mas_r * (ostovane_mas_r + ostovane_mas_h);
      double ostovane_mas_janebi_A = 2 * pi * ostovane_mas_r * ostovane_mas_h;

      set_result(ostovane_mas_kol_A, ostovane_mas_janebi_A);
    } else {
      set_error_result();
    }
  }

  makhroot_mas(String r, String h) {
    if (r != "" && h != "") {
      double makhroot_mas_r = double.parse(r);
      double makhroot_mas_h = double.parse(h);
      num makhroot_mas_l =
          sqrt(pow(makhroot_mas_r, 2) + pow(makhroot_mas_h, 2));
      double makhroot_mas_A_kol =
          pi * makhroot_mas_r * (makhroot_mas_r + makhroot_mas_l);
      double makhroot_mas_A_janebi = pi * makhroot_mas_r * makhroot_mas_l;

      set_result(makhroot_mas_A_kol, makhroot_mas_A_janebi);
    } else {
      set_error_result();
    }
  }
}
