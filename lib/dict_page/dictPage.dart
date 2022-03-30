import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jamedadi/Word.dart';
import 'package:jamedadi/dbhelper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sqflite/sqflite.dart';

class DictPage extends StatelessWidget {
  Word wordpack;

  DictPage({Key? key, required this.wordpack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: InkWell(
            child: Text(
              wordpack.word.toString(),
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
    String meaning = wordpack.meaning.toString();
    meaning = meaning.replaceAll(RegExp('[<BR>,<br>,br,<,>]'), '');
    String shareText = wordpack.word.toString() + " : " + meaning;

    return Builder(builder: (context) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Share.share(shareText);
                        },
                        icon: Icon(Iconsax.share,
                            size: 28, color: Theme.of(context).accentColor)),
                    IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: shareText));
                          final snackBar = SnackBar(
                            content: Text(
                              "کپی شد :)",
                              style: TextStyle(
                                fontFamily: "Vazir",
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(Iconsax.copy,
                            size: 28, color: Theme.of(context).accentColor)),
                  ],
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Theme.of(context).accentColor, width: 1.5)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        meaning,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    )),
              ],
            ),
          )
        ],
      );
    });
  }
}
