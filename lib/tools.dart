import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/toolspages/dama.dart';
import 'package:jamedadi/toolspages/electrisiteh.dart';
import 'package:jamedadi/toolspages/feshar.dart';
import 'package:jamedadi/toolspages/hajm.dart';
import 'package:jamedadi/toolspages/m-khayam.dart';
import 'package:jamedadi/toolspages/mahlool.dart';
import 'package:jamedadi/toolspages/masahat.dart';
import 'package:jamedadi/toolspages/zavieh.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jamedadi/toolspages/fibo.dart';
import 'package:jamedadi/toolspages/vahed.dart';
import 'toolspages/ghotr.dart';
import 'toolspages/fisa.dart';
import 'toolspages/adad.dart';
import 'toolspages/gharbal.dart';

final List imgList = [
  [
    'https://www.rodgraphic.ir/wp-content/uploads/2021/06/%D9%84%D8%B0%D8%AA-%D8%A8%D9%88%D8%B1%D8%B3-for-slide.png',
    1
  ],
  [
    'https://www.rodgraphic.ir/wp-content/uploads/2021/06/mahdiyar-for-slide.png',
    2
  ],
  [
    'https://www.rodgraphic.ir/wp-content/uploads/2021/06/green-sprout-for-slide.png',
    3
  ],
];

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(4, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(4, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(4, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
];

const List<Widget> _tiles = <Widget>[
  _toolsTile("فـیـثـاغـورث", "fisa", 1),
  _toolsTile("قــطــر", "ghotr", 1),
  _toolsTile("غـــربــال", "gharbal", 2),
  _toolsTile("زاویــه", "zavieh", 1),
  _toolsTile("فـیـبـونـاچـی", "fibo", 1),
  _toolsTile("تــبــدیــل دمــا", "dama", 2),
  _toolsTile("الکتریسیته", "elec", 1),
  _toolsTile("فـشـار", "feshar", 1),
  _toolsTile("مثلث خیام", "m-khayam", 2),
  _toolsTile("حجم", "hajm", 1),
  _toolsTile("مساحت", "masahat", 1),
];

class toolsItem extends StatefulWidget {
  @override
  _toolsItemState createState() => _toolsItemState();
}

class _toolsItemState extends State<toolsItem> {
  List _items = [
    ["adad_aval", "اعـداد اول", "تشخیص اعداد اول و محاسبه شمارنده های اعداد"],
    ["vahed", "تـبـدیـل واحـد", "تبدیل واحد در ضریب های مختلف"],
    ["mahlool", "مـحـلـول", "محاسبه غلظت و رسوب محلول"],
  ];
  List _tools = [];
  CarouselController buttonCarouselController = CarouselController();
  // Fetch content from the json file
  // Future<void> readJson() async {
  //   final String response = await rootBundle.loadString('assets/tools.json');
  //   final data = await json.decode(response);
  //   setState(() {
  //     _items = data["items"];
  //     _tools = data["more_tools"];
  //   });
  // }

  // List<ToolsItem> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchItems();
    // readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: InkWell(
            child: Text(
              "ابزار ها",
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
    return Stack(
      children: [
        Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imgList
                    .map((item) => Container(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25.0),
                            onTap: () {
                              print(imgList.indexOf(item));
                              print(imgList);
                              if (_items[imgList.indexOf(item)][0] == "vahed") {
                                print(item);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => tabdil_vahed()));
                              } else if (_items[imgList.indexOf(item)][0] ==
                                  "mahlool") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Mahlool()));
                              } else if (_items[imgList.indexOf(item)][0] ==
                                  "adad_aval") {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Adad_aval()));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.white,
                              ),
                              margin: EdgeInsets.all(5.0),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)),
                                  child: Stack(
                                    children: <Widget>[
                                      imageloader(
                                          "https://rodgraphic.ir/jamedadi/sliderbg.png"),
                                      Center(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                  _items[imgList.indexOf(item)]
                                                      [1],
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          23, 23, 23, 1.0))),
                                              Text(
                                                _items[imgList.indexOf(item)]
                                                    [2],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        50, 50, 50, 1.0)),
                                                textAlign: TextAlign.center,
                                              ),
                                            ]),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  height: MediaQuery.of(context).size.height / 4 * 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 40,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: StaggeredGridView.count(
                    crossAxisCount: 4,
                    staggeredTiles: _staggeredTiles,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    physics: BouncingScrollPhysics(),
                    padding:
                        EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
                    children: _tiles,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}

Widget imageloader(String img_url) {
  try {
    return CachedNetworkImage(
      imageUrl: img_url,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(
        value: downloadProgress.progress,
        color: Theme.of(context).accentColor,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  } on Exception {
    return Container();
  }
}

DecorationImage imageloadertile() {
  try {
    return DecorationImage(
      image: CachedNetworkImageProvider(
          "https://www.rodgraphic.ir/jamedadi/items-tile.png"),
      // image: NetworkImage("https://www.rodgraphic.ir/jamedadi/items-tile.png"),
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  } on Exception {
    return DecorationImage(
      image: AssetImage("assets/img/backtools/tile350.png"),
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }
}

Card generateItem(items, String id, context) {
  return Card(
    color: Theme.of(context).primaryColor,
    margin: EdgeInsets.all(9.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
    ),
    elevation: 10,
    child: Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {
          if (id == "ghotr") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Ghotr()));
          } else if (id == "fibo") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => fibo()));
          } else if (id == "fisa") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Fisa()));
          } else if (id == "gharbal") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Gharbal()));
          } else if (id == "vahed") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => tabdil_vahed()));
          } else if (id == "dama") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => tabdil_dama()));
          } else if (id == "elec") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Electrisiteh()));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 100,
                  child: Text(
                    items,
                    style: TextStyle(
                      fontFamily: "Vazir",
                      fontSize: 16,
                      color: Theme.of(context).accentColor,
                    ),
                    textDirection: TextDirection.rtl,
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _toolsTile extends StatelessWidget {
  const _toolsTile(this.name, this.id, this.tile_type);

  final String name;
  final String id;
  final int tile_type;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            // spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        color: Theme.of(context).primaryColor,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              image: imageloadertile(),
              borderRadius: BorderRadius.circular(25)),
          child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () {
                if (id == "ghotr") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Ghotr()));
                } else if (id == "fibo") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => fibo()));
                } else if (id == "fisa") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Fisa()));
                } else if (id == "gharbal") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Gharbal()));
                } else if (id == "vahed") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => tabdil_vahed()));
                } else if (id == "dama") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => tabdil_dama()));
                } else if (id == "elec") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Electrisiteh()));
                } else if (id == "zavieh") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Zavieh()));
                } else if (id == "feshar") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Feshar()));
                } else if (id == "mahlool") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Mahlool()));
                } else if (id == "m-khayam") {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MKhayam()));
                } else if (id == "hajm") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Hajm_home()));
                } else if (id == "masahat") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Masahat_home()));
                }
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headline5,
                    textDirection: TextDirection.rtl,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
