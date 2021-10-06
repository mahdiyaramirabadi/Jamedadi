import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jamedadi/toolspages/adad.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:jamedadi/toolspages/vahed.dart' as vahed;

List zarib_list1 = ["واحد فعلی", "d"];

class units1 extends StatelessWidget {
  final bool reverse;

  const units1({Key? key, this.reverse = false}) : super(key: key);

  // Object? get zarib => null;

  @override
  Widget build(BuildContext context) {
    List units = [
      ["سانتی گراد", "c"],
      ["فارنهایت", "f"],
      ["کلوین", "k"],
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
                  units.length,
                  (index) => ListTile(
                      title: Center(
                        child: Text(
                          units[index][0],
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).hintColor,
                          ),
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                      onTap: () {
                        zarib_list1 = units[index];
                        Navigator.of(context).pop();
                      }),
                )).toList(),
          ),
        ),
      ),
    );
  }
}
