import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:jamedadi/toolspages/masahat%20pages/polygonmodal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PolygonPage extends StatefulWidget {
  final String title;
  final String id;
  final String img_url;
  final String formula;
  final List textfield_hint;

  const PolygonPage(
      {Key? key,
      required this.title,
      required this.img_url,
      required this.formula,
      required this.textfield_hint,
      required this.id})
      : super(key: key);

  @override
  _PolygonPageState createState() => _PolygonPageState();
}

class _PolygonPageState extends State<PolygonPage> {
  var value1Controller = TextEditingController();
  var value2Controller = TextEditingController();
  String Method_hint = "روش";
  String _result = "...";
  List hint_list = ["a", "n(تعداد اضلاع)"];

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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 16,
                      child: InkWell(
                        onTap: () async {
                          await showCupertinoModalBottomSheet(
                            expand: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Methodmodal(),
                            topRadius: Radius.circular(20),
                            elevation: 10,
                            duration: Duration(milliseconds: 500),
                            animationCurve: Curves.easeInOut,
                            barrierColor: Color.fromRGBO(0, 0, 0, .8),
                          );
                          setState(() {
                            Method_hint = Method_list[0];
                            if (Method_list[1] == 2) {
                              hint_list = ["R(شعاع دایره)", "p(محیط)"];
                            } else if (Method_list[1] == 1) {
                              hint_list = ["a", "n(تعداد اضلاع)"];
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
                              Method_hint,
                              style: TextStyle(
                                fontFamily: "Vazir",
                                fontSize:
                                    MediaQuery.of(context).size.width / 20,
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
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
                        keyboardType: TextInputType.number,
                        cursorColor: Theme.of(context).cursorColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                          hintText: hint_list[0],
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
                          hintText: hint_list[1],
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
                          if (Method_list[1] == 1) {
                            chanzeli_motazam_mas(
                                value1Controller.text, value2Controller.text);
                          } else if (Method_list[1] == 2) {
                            chanzeli_motazam_mas_shoaye_dayeere_mohit(
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

  chanzeli_motazam_mas(String a, String n) {
    if (a != "" && n != "" && Method_hint != "روش") {
      double chanzeli_motazam_mas_s = double.parse(a);
      double chanzeli_motazam_mas_s2 =
          chanzeli_motazam_mas_s * chanzeli_motazam_mas_s;
      double chanzeli_motazam_mas_n = double.parse(n);
      double chanzeli_motazam_mas_soorat =
          chanzeli_motazam_mas_n * chanzeli_motazam_mas_s2;
      double chanzeli_motazam_mas_makhraj =
          4 * tan(pi / chanzeli_motazam_mas_n);
      double chanzeli_motazam_mas_A =
          chanzeli_motazam_mas_soorat / chanzeli_motazam_mas_makhraj;
      set_result(chanzeli_motazam_mas_A);
    } else {
      set_error_result();
    }
  }

  chanzeli_motazam_mas_shoaye_dayeere_mohit(String R, String p) {
    if (R != "" && p != "" && Method_hint != "روش") {
      double chanzeli_motazam_mas_shoaye_dayeere_mohit_a = double.parse(R);
      double chanzeli_motazam_mas_shoaye_dayeere_mohit_p = double.parse(p);
      double chanzeli_motazam_mas_shoaye_dayeere_mohit_A = 1 /
          2 *
          chanzeli_motazam_mas_shoaye_dayeere_mohit_a *
          chanzeli_motazam_mas_shoaye_dayeere_mohit_p;

      set_result(chanzeli_motazam_mas_shoaye_dayeere_mohit_A);
    } else {
      set_error_result();
    }
  }
}
