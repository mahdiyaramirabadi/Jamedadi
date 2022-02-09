import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

AppBar Toolsappbar(context, String header_text, String informationContent) {
  return AppBar(
    title: Text(
      header_text,
      style: TextStyle(
        fontFamily: "Vazir",
        color: Theme.of(context).accentColor,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,
    elevation: 0,
    leading: IconButton(
      onPressed: () {
        _showDialog(informationContent, context);
      },
      icon: Icon(Iconsax.info_circle, color: Theme.of(context).accentColor),
    ),
  );
}

void _showDialog(String content, BuildContext context) {
  showAnimatedDialog(
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
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
