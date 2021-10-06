import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/BottomNavigator.dart';
import 'package:jamedadi/main.dart';

class fibo extends StatefulWidget {
  @override
  _fiboState createState() => _fiboState();
}

class _fiboState extends State<fibo> {
  var ghotrController = TextEditingController();
  String _ghotr_count = "...";
  var numbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "فیبوناچی",
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
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: Theme.of(context).cursorColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(10, 20, 40, 20),
                      hintText: "ام n عدد",
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
                      borderRadius: BorderRadius.circular(35),
                      border: Border.all(
                        width: 2.0,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Theme.of(context).primaryColor),
                  height: MediaQuery.of(context).size.height / 4 * 2,
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

  void calculator(
    String max,
  ) {
    setState(() {
      numbers.clear();

      f(int a) {
        if (a == 0) {
          numbers.add("ورودی باید عددی صحیح باشد");
          ;
        } else if (a == 1) {
          numbers.add(1);
        } else {
          numbers.add(1);
          var b = 1;
          var c = 1;
          var d;
          for (int i = 0; i < a; i++) {
            d = b;
            b = b + c;
            c = d;
            var fibo = c;
            ;
            numbers.add(c);
          }
          ;
        }
      }

      f(int.parse(max));
      print(numbers);
    });
  }
}

Card generatorItems(List list, context) {
  return Card(
    color: Theme.of(context).primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    elevation: 00,
    child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 5 * 2 + 30,
        width: MediaQuery.of(context).size.width / 10 * 7 + 20,
        child: ListView.separated(
          itemCount: list.length,
          physics: BouncingScrollPhysics(),
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
