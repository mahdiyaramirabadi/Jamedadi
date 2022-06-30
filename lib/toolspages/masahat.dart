import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/toolspages/masahat%20pages/3dshapesPage.dart';
import 'package:jamedadi/toolspages/masahat%20pages/one_variable.dart';
import 'package:jamedadi/toolspages/masahat%20pages/polygonPage.dart';
import 'package:jamedadi/toolspages/masahat%20pages/three_variable.dart';
import 'package:jamedadi/toolspages/masahat%20pages/two_variable.dart';
import 'package:jamedadi/toolspages/masahat%20pages/TrianglePage.dart';
import 'package:url_launcher/url_launcher.dart';

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
  StaggeredTile.count(2, 1.5),
];

const List<Widget> _tiles = <Widget>[
  _itemsTile(
      "مثلث",
      "Triangle",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Dreieck-allg-bh.svg/512px-Dreieck-allg-bh.svg.png",
      r"""\(A = {1 \over 2}bh\)""",
      ["a"]),
  _itemsTile(
      "مستطیل",
      "Rectangle",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Rechteck-ab.svg/512px-Rechteck-ab.svg.png",
      r"""\(A = ab\)""",
      ["a", "b"]),
  _itemsTile(
      "لوزی",
      "Kite",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Raute-de.svg/512px-Raute-de.svg.png",
      r"""\(A = {1 \over 2}de\)""",
      ["d(قطر بزرگ)", "e(قطر کوچک)"]),
  _itemsTile(
      "متوازی الاضلع",
      "Parallelogram",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Parallelog-aha.svg/512px-Parallelog-aha.svg.png",
      r"""\(A = ah\)""",
      ["a", "h"]),
  _itemsTile(
      "ذوزنقه",
      "Trapezoid",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Trapez-abcdh.svg/512px-Trapez-abcdh.svg.png",
      r"""\(A = {(a+c)h \over 2}\)""",
      ["a", "c", "h"]),
  _itemsTile(
      "شش ضلعی منتظم",
      "hexagon",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Hexagon-a.svg/512px-Hexagon-a.svg.png",
      r"""\(A = {3 \over 2} {\sqrt 3} a^2\)""",
      ["a"]),
  _itemsTile(
      "هشت ضلعی منتظم",
      "octagon",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Oktagon-a.svg/512px-Oktagon-a.svg.png",
      r"""\(A = 2(1 + {\sqrt 2})a^2\)""",
      ["a"]),
  _itemsTile(
      "چند ضلعی منتظم",
      "polygon",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Oktagon-a-r-R.svg/150px-Oktagon-a-r-R.svg.png",
      r"""\(A = {\frac {na^{2}}{4\cdot \tan(\pi /n)}}\)<br> یا \(A = {\tfrac {1}{2}}Rp\)""",
      ["a", "n(تعداد اضلاع)"]),
  _itemsTile(
      "دایره",
      "Circle",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Kreis-r-tab.svg/512px-Kreis-r-tab.svg.png",
      r"""\(A = \pi r^2\)""",
      ["r"]),
  _itemsTile(
      "قطاع دایره",
      "Circular-sector",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Circle_arc.svg/512px-Circle_arc.svg.png",
      r"""\(A = {\theta \over 2}r^2 \)""",
      ["r", "θ"]),
  _itemsTile(
      "بیضی",
      "Ellipse",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Ellipse-ab-tab.svg/512px-Ellipse-ab-tab.svg.png",
      r"""\(A = \pi ab\)""",
      ["a", "b"]),
  _itemsTile(
      "استوانه",
      "cylinder",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Zylinder-1-tab.svg/512px-Zylinder-1-tab.svg.png",
      r"""\(A = 2 \pi r(r+h)\)<br>جانبی\(A= 2 \pi rh\)""",
      ["r", "h"]),
  _itemsTile(
      "مخروط",
      "Cone",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Kegel-1-tab.svg/512px-Kegel-1-tab.svg.png",
      r"""\(A=\pi r(r+{\sqrt {r^{2}+h^{2}}})\)<br>جانبی\(A= \pi rl\)<br>\(l={\sqrt {r^{2}+h^{2}}}\)""",
      ["r", "h"]),
  _itemsTile(
      "کره",
      "Sphere",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Kugel-1-tab.svg/512px-Kugel-1-tab.svg.png",
      r"""\(A = 4 \pi r^2\)""",
      ["r"]),
];

class Masahat_home extends StatefulWidget {
  @override
  _Masahat_homeState createState() => _Masahat_homeState();
}

class _Masahat_homeState extends State<Masahat_home> {
  _launchURLBrowser() async {
    const url = 'https://fa.wikipedia.org/wiki/%D9%85%D8%B3%D8%A7%D8%AD%D8%AA';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        title: InkWell(
          child: Text(
            "مساحت ها",
            style: TextStyle(
              fontFamily: "Vazir",
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(1, 1, 1, 0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _launchURLBrowser();
          },
          icon:
              Icon(Iconsax.info_circle, color: Theme.of(context).primaryColor),
        ),
      ),
      body: BodyUI(),
    );
  }

  Widget BodyUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          clipBehavior: Clip.antiAlias,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 40,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            staggeredTiles: _staggeredTiles,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 10, top: 10),
            children: _tiles,
          )),
    );
  }
}

class _itemsTile extends StatelessWidget {
  const _itemsTile(this.name, this.id, this.img_url, this.formula, this.hint);

  final String name;
  final String id;
  final String img_url;
  final String formula;
  final List hint;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      child: InkWell(
        onTap: () {
          if (id == "Triangle") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Triangle_home()));
          } else if (id == "Rectangle" ||
              id == "Kite" ||
              id == "Parallelogram" ||
              id == "Circular-sector" ||
              id == "Ellipse") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Twovar(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint)));
          } else if (id == "Trapezoid") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Threevar(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint)));
          } else if (id == "hexagon" ||
              id == "octagon" ||
              id == "Circle" ||
              id == "Sphere") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Onevar(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint[0])));
          } else if (id == "Cone" || id == "cylinder") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => shapePage(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint)));
          } else if (id == "polygon") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PolygonPage(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint)));
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: img_url,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: Theme.of(context).accentColor,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
