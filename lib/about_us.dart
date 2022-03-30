import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
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
          "جعبه ابزار",
          style: TextStyle(
            fontFamily: "Vazir",
            color: Theme.of(context).accentColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon:
              Icon(Iconsax.arrow_left_2, color: Theme.of(context).accentColor),
        ),
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
              CachedNetworkImage(
                imageUrl: "https://www.rodgraphic.ir/jamedadi/about_us.jpg",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Theme.of(context).accentColor,
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 10),
                child: Column(children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ":درباره جعبه ابزار",
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "جعبه ابزار اپلیکیشنی جامع متشکل از ابزارهای محاسباتی،درسنامه هاو نمونه سوالات مناسب مقطع تحصیلی متوسطه اول است.در بخش ابزارها شما به ابزارهای محاسباتی مختلفی نظیر تبدیل واحد ها در ضرایب گوناگون،غربال اعداد و ... دسترسی دارید.بخش درسنامه ها و نمونه سوالات مخزنی از درسنامه ها و نمونه‌سوالات با کیفیت هست که بزودی راه اندازی خواهد شد.",
                        style: Theme.of(context).textTheme.bodyText1,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      )),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ":تیم جعبه ابزار",
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '''تیم جعبه ابزار تیمی متشکل از دانش اموزان دبیرستان هاشـمـی نـژاد یک (مرکز 1 اسـتـعـداد های درخـشـان) اسـت که همواره سعی بر بهتر شدن جعبه ابزار دارند. تیمی خلاق و پیشرو!
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
                child: Text("جعبه ابزار نسخه 1.0")),
          ),
        )
      ],
    );
  }
}
