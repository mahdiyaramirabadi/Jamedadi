import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/about_us.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
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

  _launchURLBrowser(String url) async {
    String _url = url;
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: InkWell(
            child: Text(
              "تنظیمات",
              style: TextStyle(
                fontFamily: "Vazir",
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: Icon(Iconsax.arrow_left_2,
                color: Theme.of(context).primaryColor),
          ),
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
                    _launchURLBrowser("https://zil.ink/jamedadi");
                  }

                  // () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (BuildContext context) => MyWebView(
                  //             title: "ارتباط با ما",
                  //             selectedUrl:
                  //                 "https://mahdiyaramirabadi.github.io/jamedadisite/",
                  //           )));
                  // }
                  ,
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
                            "ارتباط با ما",
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
