import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamedadi/toolspages/adad.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:jamedadi/toolspages/vahed.dart' as vahed;

List zarib_list1 = ["پیشوند فعلی", 0];

class listofunits_v1 extends StatelessWidget {
  final bool reverse;

  const listofunits_v1({Key? key, this.reverse = false}) : super(key: key);

  // Object? get zarib => null;

  @override
  Widget build(BuildContext context) {
    List test = [
      ["ترا", 12],
      ["گیگا", 9],
      ["مگا", 6],
      ["کیلو", 3],
      ["هکتو", 2],
      ["دکا", 1],
      ["ضریب یک", 11],
      ["دسی", -1],
      ["سانتی", -2],
      ["میلی", -3],
      ["میکرو", -6],
      ["نانو", -9],
      ["پیکو", -12]
    ];

    var textcontroller = ScrollController();
    return Material(
      child: CupertinoPageScaffold(
        backgroundColor: Theme.of(context).backgroundColor,
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
                              color: Theme.of(context).hintColor),
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                      onTap: () {
                        zarib_list1 = test[index];
                        Navigator.of(context).pop();
                      }),
                )).toList(),
          ),
        ),
      ),
    );
  }
}
