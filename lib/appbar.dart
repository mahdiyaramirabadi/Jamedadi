import 'package:flutter/material.dart';

AppBar Toolsappbar(context, String header_text) {
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
  );
}
