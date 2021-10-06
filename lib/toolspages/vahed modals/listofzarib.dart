import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamedadi/toolspages/adad.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:jamedadi/toolspages/vahed.dart' as vahed;

List zarib_kol_list = ["ضریب کل", 0];

class listofzarib extends StatelessWidget {
  final bool reverse;

  const listofzarib({Key? key, this.reverse = false}) : super(key: key);

  // Object? get zarib => null;

  @override
  Widget build(BuildContext context) {
    List test = [
      ["طول(متر)", 1],
      ["مساحت(متر مربع)", 2],
      ["حجم(متر مکعب)", 3],
    ];

    var textcontroller = ScrollController();
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: Theme.of(context).primaryColor,
        navigationBar: CupertinoNavigationBar(
            backgroundColor: Theme.of(context).accentColor,
            border: Border.all(width: 0, color: Theme.of(context).accentColor),
            leading: Container(),
            middle: Text(
              'انتخاب کنید',
              style: TextStyle(
                fontFamily: "Vazir",
                fontSize: MediaQuery.of(context).size.width / 20,
                color: Theme.of(context).primaryColor,
              ),
            )),
        child: SafeArea(
          bottom: false,
          child: ListView(
            reverse: reverse,
            shrinkWrap: true,
            controller: textcontroller,
            physics: BouncingScrollPhysics(),
            children: ListTile.divideTiles(
                context: context,
                tiles: List.generate(
                  test.length,
                  (index) => ListTile(
                      title: Center(
                        child: Text(
                          test[index][0],
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).hintColor,
                          ),
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                      onTap: () {
                        zarib_kol_list = test[index];
                        Navigator.of(context).pop();
                      }),
                )).toList(),
          ),
        ),
      ),
    );
  }
}
