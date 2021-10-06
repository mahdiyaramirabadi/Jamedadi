import 'dart:convert';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jamedadi/ThemeManager.dart';
import 'package:jamedadi/about_us.dart';
import 'package:jamedadi/main.dart';

import 'package:provider/provider.dart';
import 'Theme_Provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeEnabled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: InkWell(
            child: Text(
              "تنظمیات",
              style: TextStyle(
                fontFamily: "Vazir",
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
          leading: Icon(Icons.ios_share, color: Theme.of(context).primaryColor),
        ),
        body: BodyUI());
  }

  Widget BodyUI() {
    // final themeProvider = Provider.of<ThemeProvider>(context);

    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Consumer<ThemeNotifier>(
                          builder: (context, notifier, child) =>
                              DayNightSwitcher(
                            isDarkModeEnabled: notifier.darkTheme!,
                            onStateChanged: (value) {
                              notifier.toggleTheme();
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "حالت پوسته",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 19,
                              color: Theme.of(context).hintColor),
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  color: Theme.of(context).hintColor,
                  endIndent: 0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutUsPage()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width / 3.3,
                            height: 45,
                            child: Icon(
                              Icons.chevron_left,
                              color: Theme.of(context).hintColor,
                              size: MediaQuery.of(context).size.width / 14,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width / 3.3,
                          child: Text(
                            "درباره ما",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: MediaQuery.of(context).size.width / 19,
                              color: Theme.of(context).hintColor,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Theme.of(context).hintColor,
                  endIndent: 0,
                ),
                InkWell(
                  onTap: () {
                    print("object");
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width / 3.3,
                            height: 45,
                            child: Icon(
                              Icons.chevron_left,
                              color: Theme.of(context).hintColor,
                              size: MediaQuery.of(context).size.width / 14,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width / 3.3,
                          child: Text(
                            "گزارش باگ",
                            style: TextStyle(
                              fontFamily: "Vazir",
                              fontSize: MediaQuery.of(context).size.width / 19,
                              color: Theme.of(context).hintColor,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
