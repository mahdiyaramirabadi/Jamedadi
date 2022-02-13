import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/toolspages/hajm%20pages/ParallelepipedPage.dart';
import 'package:jamedadi/toolspages/hajm%20pages/one_variable.dart';
import 'package:jamedadi/toolspages/hajm%20pages/three_variable.dart';
import 'package:jamedadi/toolspages/hajm%20pages/two_variable.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:jamedadi/toolspages/hajm%20pages/one_variable.dart';
import 'package:flutter_tex/flutter_tex.dart';

const List<StaggeredTile> _staggeredTiles = <StaggeredTile>[
  StaggeredTile.count(2, 2),
  StaggeredTile.count(2, 2.5),
  StaggeredTile.count(2, 3),
  StaggeredTile.count(2, 2.5),
];

const List<Widget> _tiles = <Widget>[
  _itemsTile(
      "مساحت با قائده و ارتفاع",
      "Triangle",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Dreieck-allg-bh.svg/512px-Dreieck-allg-bh.svg.png",
      r"""\(A = {1 \over 2}bh\)""",
      ["a"]),
  _itemsTile(
      "مساحت با سه ظلع و محیط",
      "Rectangle",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Dreieck-allg.svg/512px-Dreieck-allg.svg.png",
      r"""\(A={\sqrt {s(s-a)(s-b)(s-c)}}\)""",
      ["a", "b", "c"]),
  _itemsTile(
      "مساحت با دو ضلع و زاویه بین",
      "Kite",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Dreieck-allg-w.svg/512px-Dreieck-allg-w.svg.png",
      r"""\( A={\frac {1}{2}}ab\sin(\gamma )\)""",
      ["B(مساحت قائده)", "h(ارتفاع)"]),
  _itemsTile(
      "مساحت مثلث متساوی الاضلع",
      "Parallelogram",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Dreieck-gseit.svg/512px-Dreieck-gseit.svg.png",
      r"""\(A={\frac {\sqrt {3}}{4}}a^{2}\)""",
      ["a", "b", "c", "آلفا", "بتا", "گاما"]),
];

class Triangle_home extends StatefulWidget {
  @override
  _Triangle_homeState createState() => _Triangle_homeState();
}

class _Triangle_homeState extends State<Triangle_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
          title: InkWell(
            child: Text(
              "مثلث ها",
              style: TextStyle(
                fontFamily: "Vazir",
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(1, 1, 1, 0),
          elevation: 0,
          leading: SizedBox()),
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
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Onevar(
                  title: name,
                  id: id,
                  img_url: img_url,
                  formula: formula,
                  textfield_hint: hint[0])));
        },
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                    imageUrl: img_url,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: Theme.of(context).accentColor,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
