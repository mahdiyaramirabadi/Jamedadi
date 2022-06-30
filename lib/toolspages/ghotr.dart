import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/appbar.dart';
import 'package:jamedadi/main.dart';

class Ghotr extends StatefulWidget {
  @override
  _GhotrState createState() => _GhotrState();
}

class _GhotrState extends State<Ghotr> {
  var ghotrController = TextEditingController();
  String _ghotr_count = "...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: Toolsappbar(context, "قطر",
          "تعداد اضلاع را وادر کنید سپس روی محاسبه کلیک کنید. عددی که مشاهده می کنید تعداد قطر های چند ضلعی خواسته شده است"),
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
                      hintText: "تعداد اضلاع",
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
                    controller: ghotrController,
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
                      calculator(ghotrController.text);
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
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Theme.of(context).backgroundColor),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(_ghotr_count,
                        style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 18,
                            color: Theme.of(context).hintColor,
                            decoration: TextDecoration.underline)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calculator(String azla) {
    setState(() {
      int a = int.parse(azla);
      int b = a - 3;
      int c = b * a;
      int d = c ~/ 2;
      String e = d.toString();

      _ghotr_count = e;
    });
  }
}
