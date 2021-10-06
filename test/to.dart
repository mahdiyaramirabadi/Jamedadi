// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart';
// import 'package:jamedadi/fibo.dart';
// import 'toolsItem.dart';
// import 'ghotr.dart';
//
//
// class toolsItem extends StatefulWidget {
//   @override
//   _toolsItemState createState() => _toolsItemState();
// }
//
// class _toolsItemState extends State<toolsItem> {
//   List _items = [];
//
//   // Fetch content from the json file
//   Future<void> readJson() async {
//     final String response = await rootBundle.loadString('assets/sample.json');
//     final data = await json.decode(response);
//     setState(() {
//       _items = data["items"];
//     });
//   }
//   // List<ToolsItem> _items = [];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // fetchItems();
//     readJson();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(45, 76, 94, 1.0),
//       appBar: AppBar(
//         title: InkWell(
//           onTap: readJson,
//           child: Text(
//             "ابزار ها",
//             style: TextStyle(
//               fontFamily: "Vazir",
//               color: Color.fromRGBO(237, 198, 165, 1.0),
//
//             ),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color.fromRGBO(45, 76, 94, 1.0),
//         elevation: 0,
//         leading: Icon(Icons.ios_share, color: Color.fromRGBO(237, 198, 165, 1.0)),
//
//
//       ),
//       body: Padding(
//           padding: EdgeInsets.all(5.0),
//           child: Container(
//             height: MediaQuery.of(context).size.height /4,
//
//             child: ListView.builder(
//
//               itemCount: _items.length,
//               scrollDirection: Axis.horizontal,
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Card(
//                   margin: EdgeInsets.all(10),
//                   child: ListTile(
//                     leading: Text(_items[index]["id"]),
//                     title: Text(_items[index]["text"]),
//
//                   ),
//                 );
//               },
//             ),
//           )
//       ),
//     );
//   }
// // void fetchItems() async {
// //   final String response = await rootBundle.loadString('assets/sample.json');
// //   final data = await json.decode(response);
// //
// //
// //     setState(() {
// //       var ItemJson = jsonDecode(utf8.decode(data.bodyBytes));
// //       for (var i in ItemJson) {
// //         var toolsItem1 = ToolsItem(i["text"], i["id"]);
// //         _items.add(toolsItem1);
// //       }
// //       print(_items);
// //
// //   });
// // }
//
//
//
//
//
// }
//
// Card generateItem(ToolsItem items,String id,context){
//   return Card(
//
//     color: Color.fromRGBO(237, 198, 165, 1.0),
//     margin: EdgeInsets.all(9.0),
//
//
//     shape: RoundedRectangleBorder(
//
//       borderRadius: BorderRadius.all(Radius.circular(20)),),
//
//
//
//
//     child: Center(
//       child: InkWell(
//         onTap: (){
//           if(items.id == "ghotr"){
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => Ghotr()));
//           }else if(items.id == "fibo"){
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => fibo()));
//           }
//
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Center(
//                 child: Container(
//                   alignment: Alignment.center,
//                   width: 150,
//                   height: 100,
//                   child: Text(
//                     items.text,
//                     style: TextStyle(
//                       fontFamily: "Vazir",
//                       fontSize: 20 ,
//                       color: Color.fromRGBO(45, 76, 94, 1.0),
//
//                     ),
//                     textDirection: TextDirection.rtl,
//                     // textAlign: TextAlign.center,
//
//                   ),
//
//                 ),
//
//               ),
//
//
//
//             ),
//           ],
//         ),
//       ),
//
//
//
//     ),
//
//   );
//
//
// }
