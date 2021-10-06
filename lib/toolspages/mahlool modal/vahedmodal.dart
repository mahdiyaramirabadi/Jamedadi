import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List vahed_list = ["ضریب کل", 0];

class vahedmodal extends StatelessWidget {
  final bool reverse;

  const vahedmodal({Key? key, this.reverse = false}) : super(key: key);

  // Object? get zarib => null;

  @override
  Widget build(BuildContext context) {
    List values = [
      ["درصد", "darsad"],
      ["ppm", "ppm"]
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
                  values.length,
                  (index) => ListTile(
                      title: Center(
                        child: Text(
                          values[index][0],
                          style: TextStyle(
                            fontFamily: "Vazir",
                            fontSize: MediaQuery.of(context).size.width / 20,
                            color: Theme.of(context).hintColor,
                          ),
                          // textDirection: TextDirection.rtl,
                        ),
                      ),
                      onTap: () {
                        vahed_list = values[index];
                        Navigator.of(context).pop();
                      }),
                )).toList(),
          ),
        ),
      ),
    );
  }
}
