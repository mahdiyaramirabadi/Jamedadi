import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'mahlool modal/vahedmodal.dart';

class MKhayam extends StatefulWidget {
  @override
  _MKhayamState createState() => _MKhayamState();
}

class _MKhayamState extends State<MKhayam> {
  var GhotrController = TextEditingController();
  var NumberController = TextEditingController();

  String _m_result_count = "...";

  // =================================

  var N_GhotrController = TextEditingController();
  var N_NumberController = TextEditingController();
  String _N_result_count = "...";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "مثلث خیام",
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
                          "مجموع",
                          style: TextStyle(
                              fontFamily: "Vazir",
                              color: Theme.of(context).primaryColor,
                              fontSize: 18),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "ام n عدد",
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
                                          RegExp(r'[0-9]')),
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 20, 40, 20),
                                      hintText: "قطر را وارد کنید",
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
                                    controller: GhotrController,
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
                                        RegExp(r'[0-9]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 20, 40, 20),
                                    hintText: "عدد را وارد کنید",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 16),
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
                                  controller: NumberController,
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
                                    m_khayam_calculator(GhotrController.text,
                                        NumberController.text);
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
                                    _m_result_count,
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
                                          RegExp(r'[0-9]')),
                                    ],
                                    keyboardType: TextInputType.number,
                                    cursorColor: Theme.of(context).cursorColor,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(10, 20, 40, 20),
                                      hintText: "قطر را وارد کنید",
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
                                    controller: N_GhotrController,
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
                                        RegExp(r'[0-9]')),
                                  ],
                                  keyboardType: TextInputType.number,
                                  cursorColor: Theme.of(context).cursorColor,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 20, 40, 20),
                                    hintText: "ام n عدد",
                                    hintStyle: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 16),
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
                                  controller: N_NumberController,
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
                                    n_khayam_calculator(N_GhotrController.text,
                                        N_NumberController.text);
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
                                    _N_result_count,
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

  void _showDialog(String content, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(
              "راهنما",
              style: Theme.of(context).textTheme.headline5,
              textDirection: TextDirection.rtl,
            ),
            content: new Text(
              content,
              style: Theme.of(context).textTheme.bodyText1,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            ),
            actions: <Widget>[
              new FlatButton(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: new Text(
                    "متوجه شدم",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          );
        });
  }

  // ignore: non_constant_identifier_names
  m_khayam_calculator(String Ghotr, String Number) {
    int m = int.parse(Ghotr);
    //m = ghotr ha
    int n = int.parse(Number);
    //n = adad dar ghotr
    int m1 = m + 1;
    int mn1 = m + n;
    int n1 = n - 1;

    int num1 = m1;
    int factorialm = 1;
    for (var i = num1; i >= 1; i--) {
      factorialm *= i;
    }

    int facM = factorialm;

    int num2 = mn1;
    int factorialmn = 1;
    for (var i = num2; i >= 1; i--) {
      factorialmn *= i;
    }

    int facMn = factorialmn;

    int num3 = n1;
    int factorialn = 1;
    for (var i = num3; i >= 1; i--) {
      factorialn *= i;
    }

    int facN = factorialn;

    var res_1 = facMn ~/ facN;
    var result = res_1 ~/ facM;

    setState(() {
      _m_result_count = result.toString();
    });
  }

  n_khayam_calculator(String Ghotr, String Number) {
    int m = int.parse(Ghotr);
    //m = ghotr
    int n = int.parse(Number);
    //n = adad dar ghotr
    int mn = m + n;
    //m+n
    int mn1 = mn - 1;
    //m+n - 1
    int n1 = n - 1;
    //n - 1

    int num1 = m;
    int factorialm = 1;
    for (var i = num1; i >= 1; i--) {
      factorialm *= i;
    }

    int fac_m = factorialm;

    int num2 = mn1;
    int factorialmn = 1;
    for (var i = num2; i >= 1; i--) {
      factorialmn *= i;
    }

    int fac_mn = factorialmn;

    int num3 = n1;
    int factorialn = 1;
    for (var i = num3; i >= 1; i--) {
      factorialn *= i;
    }

    int fac_n = factorialn;

    int res_1 = fac_mn ~/ fac_n;
    int result = res_1 ~/ fac_m;

    setState(() {
      _N_result_count = result.toString();
    });
  }
}
