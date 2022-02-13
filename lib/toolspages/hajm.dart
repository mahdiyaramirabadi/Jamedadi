import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/toolspages/hajm%20pages/ParallelepipedPage.dart';
import 'package:jamedadi/toolspages/hajm%20pages/three_variable.dart';
import 'package:jamedadi/toolspages/hajm%20pages/two_variable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'hajm pages/one_variable.dart';
import 'package:flutter_tex/flutter_tex.dart';

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
  StaggeredTile.count(4, 1.5),
];

const List<Widget> _tiles = <Widget>[
  _itemsTile(
      "مکعب",
      "Cube",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Wuerfel-1-tab.svg/512px-Wuerfel-1-tab.svg.png",
      r"""\(V = a^3\)""",
      ["a"]),
  _itemsTile(
      "مکعب مستطیل",
      "Cuboid",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Quader-1-tab.svg/512px-Quader-1-tab.svg.png",
      r"""\(V = abc\)""",
      ["a", "b", "c"]),
  _itemsTile(
      "منشور",
      "Prism",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/Prisma-1-e.svg/512px-Prisma-1-e.svg.png",
      r"""\(V = Bh\)<br> B=مساحت قائده""",
      ["B(مساحت قائده)", "h(ارتفاع)"]),
  _itemsTile(
      "هرم",
      "Pyramid",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d3/Pyramide-46-e.svg/512px-Pyramide-46-e.svg.png",
      r"""\(V = {1 \over 3}Bh\)<br> B=مساحت قائده""",
      ["B(مساحت قائده)", "h(ارتفاع)"]),
  _itemsTile(
      "متوازی السطوح",
      "Parallelepiped",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Parallelepiped-1-tab.svg/512px-Parallelepiped-1-tab.svg.png",
      r"""\(V = abc \sqrt K \)<br> \(K=1+2 \cos(\alpha)\cos(\beta )\cos(\gamma ) \\ - \cos^2(\alpha)-\cos^2(\beta )-\cos^2(\gamma)  \) """,
      ["a", "b", "c", "آلفا", "بتا", "گاما"]),
  _itemsTile(
      "چهاروجهی منتظم",
      "Tetrahedron",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Tetraeder-1-tab.svg/512px-Tetraeder-1-tab.svg.png",
      r"""\(V = {\sqrt 2 \over 12} a^3 \)""",
      ["a"]),
  _itemsTile(
      "کره",
      "Sphere",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Kugel-1-tab.svg/512px-Kugel-1-tab.svg.png",
      r"""\(V = {4 \over 3} \pi r^3 \)""",
      ["r"]),
  _itemsTile(
      "بیضی‌گون",
      "Ellipsoid",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Ellipsoid-1-tab.svg/512px-Ellipsoid-1-tab.svg.png",
      r"""\(V = {4 \over 3} \pi abc \)""",
      ["a", "b", "c"]),
  _itemsTile(
      "استوانه",
      "Circular-Cylinder",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Zylinder-1-tab.svg/512px-Zylinder-1-tab.svg.png",
      r"""\(V = \pi r^2 h \)""",
      ["r(شعاع قائده)", "h(ارتفاع)"]),
  _itemsTile(
      "مخروط",
      "Cone",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Kegel-1-tab.svg/512px-Kegel-1-tab.svg.png",
      r"""\(V = {1 \over 3 } \pi r^2 h \)""",
      ["r(شعاع قائده)", "h(ارتفاع)"]),
  _itemsTile(
      "چنبره",
      "Solid-torus",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Torus-1-tab.svg/512px-Torus-1-tab.svg.png",
      r"""\(V = 2 \pi ^2 Rr^2 \)""",
      ["r", "R"]),
];

class Hajm_home extends StatefulWidget {
  @override
  _Hajm_homeState createState() => _Hajm_homeState();
}

class _Hajm_homeState extends State<Hajm_home> {
  _launchURLBrowser() async {
    const url = 'https://fa.wikipedia.org/wiki/%D8%AD%D8%AC%D9%85';
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
            "حجم ها",
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
          if (id == "Cube" || id == "Sphere" || id == "Tetrahedron") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Onevar(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint[0])));
          } else if (id == "Prism" ||
              id == "Pyramid" ||
              id == "Solid-torus" ||
              id == "Circular-Cylinder" ||
              id == "Cone") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Twovar(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint)));
          } else if (id == "Ellipsoid" || id == "Cuboid") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Threevar(
                    title: name,
                    id: id,
                    img_url: img_url,
                    formula: formula,
                    textfield_hint: hint)));
          } else if (id == "Parallelepiped") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Parallelepiped(
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
