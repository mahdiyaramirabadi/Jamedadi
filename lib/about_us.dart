import 'package:flutter/material.dart';
import 'BottomNavigator.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool isDarkModeEnabled = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          "جامدادی",
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: Icon(Icons.ios_share, color: Theme.of(context).accentColor),
      ),
      body: BodyUI(),
    );
  }

  Widget BodyUI() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Image.network("https://www.rodgraphic.ir/jamedadi/about_us.jpg"),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ":درباره جامدادی",
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "جامدادی اپلیکیشنی جامع متشکل از ابزارهای محاسباتی،درسنامه هاو نمونه سوالات مناسب مقطع تحصیلی متوسطه اول است.در بخش ابزارها شما به ابزارهای محاسباتی مختلفی نظیر تبدیل واحد ها در ضرایب گوناگون،غربال اعداد و ... دسترسی دارید.بخش درسنامه ها و نمونه سوالات مخزنی از درسنامه ها و نمونه‌سوالات با کیفیت هست که بزودی همراه بخش لغتنامه راه اندازی خواهد شد.",
                        style: Theme.of(context).textTheme.bodyText1,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      )),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ":تیم جامدادی",
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '''تیم جامدادی تیمی متشکل از دانش اموزان دبیرستان هاشـمـی نـژاد یک (مرکز 1 اسـتـعـداد های درخـشـان) اسـت که همواره سعی بر بهتر شدن جامدادی دارند. تیمی خلاق و پیشرو!
برنامه نویسان: مهدی‌یار امیرآبادی ، محمد عرفان معتمد زاده
طراح UI و گرافیک : مهدی‌یار برهمت ، مهدی‌یار امیرآبادی
                        ''',
                        style: Theme.of(context).textTheme.bodyText1,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      )),
                ]),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.bottomCenter,
            color: Theme.of(context).backgroundColor,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Padding(
                padding: EdgeInsets.only(bottom: 15, top: 10),
                child: Text("جامدادی نسخه 0.1")),
          ),
        )
      ],
    );
  }
}
