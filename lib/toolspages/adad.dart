import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';

class Adad_aval extends StatefulWidget {
  @override
  _Adad_avalState createState() => _Adad_avalState();
}

class _Adad_avalState extends State<Adad_aval> {
  var numController = TextEditingController();
  String _AdadAval = "...";
  List numbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "اعداد اول",
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: Icon(Icons.ios_share, color: Theme.of(context).accentColor),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Theme.of(context).accentColor,
              size: 25,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: AdadAvalUI(),
    );
  }

  Widget AdadAvalUI() {
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
                  child: Center(
                    child: TextField(
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      keyboardType: TextInputType.number,
                      cursorColor: Theme.of(context).cursorColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                        hintText: "...عدد را وارد کنید",
                        hintStyle:
                            TextStyle(color: Theme.of(context).accentColor),
                        icon: Padding(
                          padding: EdgeInsets.only(left: 15),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Vazir",
                        fontSize: MediaQuery.of(context).size.width / 20,
                        color: Theme.of(context).accentColor,
                      ),
                      controller: numController,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
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
                      calculator(numController.text);
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
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Theme.of(context).backgroundColor),
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      _AdadAval,
                      style: TextStyle(
                        fontFamily: "Vazir",
                        fontSize: MediaQuery.of(context).size.width / 18,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      width: 2.0,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 4 * 2 - 10,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: generatorItems(numbers, context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void calculator(String num) {
    setState(() {
      int startingPoint = 1;
      int endPoint = 0;
      int factors = 0;
      numbers = [];

      void testPrime(int testPrime) {
        endPoint = testPrime;
        for (startingPoint; startingPoint <= endPoint; startingPoint++) {
          if (endPoint % startingPoint == 0) {
            factors++;
            numbers.add(startingPoint);
          }
        }
        print(numbers);
        if (factors <= 2) {
          _AdadAval = "$num : اول است";
        } else {
          _AdadAval = "$num : اول نیست";
        }
      }

      /// pass any number to test whether it's prime or not
      testPrime(int.parse(num));
    });
  }
}

Card generatorItems(List list, context) {
  return Card(
    color: Color.fromRGBO(237, 198, 165, 0.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(35)),
    ),
    elevation: 0,
    child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 5 * 2 + 30,
        width: MediaQuery.of(context).size.width / 10 * 7 + 20,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: list.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            color: Theme.of(context).accentColor,
            height: 2,
            indent: 5.0,
            endIndent: 5.0,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                '${list[index]}',
                style: TextStyle(
                    fontFamily: "Vazir", color: Theme.of(context).hintColor),
              ),
            );
          },
        )),
  );
}
