import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tex/flutter_tex.dart';

class Parallelepiped extends StatefulWidget {
  final String title;
  final String id;
  final String img_url;
  final String formula;
  final List textfield_hint;

  const Parallelepiped(
      {Key? key,
      required this.title,
      required this.img_url,
      required this.formula,
      required this.textfield_hint,
      required this.id})
      : super(key: key);

  @override
  _ParallelepipedState createState() => _ParallelepipedState();
}

class _ParallelepipedState extends State<Parallelepiped> {
  var value1Controller = TextEditingController();
  var value2Controller = TextEditingController();
  var value3Controller = TextEditingController();
  var value4Controller = TextEditingController();
  var value5Controller = TextEditingController();
  var value6Controller = TextEditingController();

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
          Positioned.fill(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                    top: MediaQuery.of(context).size.height / 40,
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
                          hintText: widget.textfield_hint[3],
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
                        controller: value4Controller,
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
                          hintText: widget.textfield_hint[4],
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
                        controller: value5Controller,
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
                          hintText: widget.textfield_hint[5],
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
                        controller: value6Controller,
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
                          motvazialsotooh_hajm();
                          // Parallelepiped_hajm(
                          //     value1Controller.text,
                          //     value2Controller.text,
                          //     value3Controller.text,
                          //     value4Controller.text,
                          //     value5Controller.text,
                          //     value6Controller.text);
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
                                fontSize:
                                    MediaQuery.of(context).size.width / 18,
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

  Parallelepiped_hajm(
      String a, String b, String c, String alfa, String beta, String gamma) {
    if (a != "" &&
        b != "" &&
        c != "" &&
        alfa != "" &&
        beta != "" &&
        gamma != "") {
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
      var _c;
      if (c.contains(".") == true) {
        _c = double.parse(c);
      } else if (c.contains(".") == false) {
        _c = int.parse(c);
      }
      var _alfa;
      if (alfa.contains(".") == true) {
        _alfa = double.parse(alfa);
      } else if (alfa.contains(".") == false) {
        _alfa = int.parse(alfa);
      }

      var _beta;
      if (beta.contains(".") == true) {
        _beta = double.parse(beta);
      } else if (beta.contains(".") == false) {
        _beta = int.parse(beta);
      }
      var _gamma;
      if (gamma.contains(".") == true) {
        _gamma = double.parse(gamma);
      } else if (gamma.contains(".") == false) {
        _gamma = int.parse(gamma);
      }
      var motvazi_hajm_a = _a;
      var motvazi_hajm_b = _b;
      var motvazi_hajm_c = _c;
      var motvazi_hajm_alfa = _alfa;
      var motvazi_hajm_beta = _beta;
      var motvazi_hajm_gama = _gamma;
      var motvazi_hajm_alfa_rad = motvazi_hajm_alfa * pi / 180;
      var motvazi_hajm_beta_rad = motvazi_hajm_beta * pi / 180;
      var motvazi_hajm_gama_rad = motvazi_hajm_gama * pi / 180;
      var motvazi_hajm_alfa_cos = cos(motvazi_hajm_alfa_rad);
      var motvazi_hajm_beta_cos = cos(motvazi_hajm_beta_rad);
      var motvazi_hajm_gama_cos = cos(motvazi_hajm_gama_rad);
      print(motvazi_hajm_alfa);
      print(motvazi_hajm_beta);
      print(motvazi_hajm_gama);

      print(motvazi_hajm_alfa_cos);
      print(motvazi_hajm_beta_cos);
      print(motvazi_hajm_gama_cos);
      var motvazi_hajm_alfa_cos2 =
          motvazi_hajm_alfa_cos * motvazi_hajm_alfa_cos;
      var motvazi_hajm_beta_cos2 =
          motvazi_hajm_beta_cos * motvazi_hajm_beta_cos;
      var motvazi_hajm_gama_cos2 =
          motvazi_hajm_gama_cos * motvazi_hajm_gama_cos;
      print(motvazi_hajm_alfa_cos2);
      print(motvazi_hajm_beta_cos2);
      print(motvazi_hajm_gama_cos2);
      var K = 1 +
          2 *
              motvazi_hajm_alfa_cos *
              motvazi_hajm_beta_cos *
              motvazi_hajm_gama_cos -
          motvazi_hajm_alfa_cos2 -
          motvazi_hajm_beta_cos2 -
          motvazi_hajm_gama_cos2;
      print(K);

      var morvazi_hajm_radicalK = sqrt(K);
      print(morvazi_hajm_radicalK);
      var motvazi_hajm_V = motvazi_hajm_a *
          motvazi_hajm_b *
          motvazi_hajm_c *
          morvazi_hajm_radicalK;
      print(motvazi_hajm_V);

      setState(() {
        _result = motvazi_hajm_V.toString();
      });
    } else {
      setState(() {
        _result = "لطفا مقادیر را وارد کنید";
      });
    }
  }

  motvazialsotooh_hajm() {
    double motvazi_hajm_a = 2;
    double motvazi_hajm_b = 3;
    double motvazi_hajm_c = 4;
    double motvazi_hajm_alfa = 60;
    double motvazi_hajm_beta = 30;
    double motvazi_hajm_gama = 120;
    //adad ha delkhahan . rasti hatman inu too net search kon kheyli jozam dare
    //ye vakh gir nakoni to voroodia
    double motvazi_hajm_alfa_rad = motvazi_hajm_alfa * pi / 180;
    double motvazi_hajm_beta_rad = motvazi_hajm_beta * pi / 180;
    double motvazi_hajm_gama_rad = motvazi_hajm_gama * pi / 180;
    //adad haye in balaiye  delkhah nist va formoole
    double motvazi_hajm_alfa_cos = cos(motvazi_hajm_alfa_rad);
    double motvazi_hajm_beta_cos = cos(motvazi_hajm_beta_rad);
    double motvazi_hajm_gama_cos = cos(motvazi_hajm_gama_rad);
    double motvazi_hajm_alfa_cos2 =
        motvazi_hajm_alfa_cos * motvazi_hajm_alfa_cos;
    double motvazi_hajm_beta_cos2 =
        motvazi_hajm_beta_cos * motvazi_hajm_beta_cos;
    double motvazi_hajm_gama_cos2 =
        motvazi_hajm_gama_cos * motvazi_hajm_gama_cos;
    double K = 1 +
        2 *
            motvazi_hajm_alfa_cos *
            motvazi_hajm_beta_cos *
            motvazi_hajm_gama_cos -
        motvazi_hajm_alfa_cos2 -
        motvazi_hajm_beta_cos2 -
        motvazi_hajm_gama_cos2;

    double morvazi_hajm_radicalK = sqrt(K);
    double motvazi_hajm_V = motvazi_hajm_a *
        motvazi_hajm_b *
        motvazi_hajm_c *
        morvazi_hajm_radicalK;
    print("hajme motevazi al sotooh :");
    print(motvazi_hajm_V);
  }
}
