import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      color: Color.fromRGBO(45, 76, 94, 1.0),
      shape: CircularNotchedRectangle(),
      notchMargin: 10.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: MediaQuery.of(context).size.height / 13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 13,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2 - 20,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Icon(Icons.home, color: Color.fromRGBO(237, 198, 165, 1.0),),
              IconButton(
                  icon: Icon(Icons.person_outline, color: Color.fromRGBO(237, 198, 165, 1.0),),
                  onPressed: () {
                    // Navigator.of(context).push(
                    //    PageRouteBuilder(
                    //       // transitionDuration: Duration(seconds: 1),
                    //       pageBuilder: (BuildContext context,
                    //       Animation<double> animation,
                    //       Animation<double> secondAnimation) {
                    //         return LoginWidget();
                    //         },
                    //     transitionsBuilder: (BuildContext context,
                    //     Animation<double> animation,
                    //     Animation<double> secondAnimation,
                    //     Widget child) {
                    //       return SlideTransition(
                    //         child: child,
                    //         position: Tween<Offset>(
                    //         begin: Offset(1, 0), end: Offset(0, 0))
                    //             .animate(CurvedAnimation(
                    //         parent: animation, curve: Curves.easeInCirc)),
                    //       );
                    //     }),
                    // );
                  },
            )
          ],
        ),
      ),
      Container(
        height: 50,

        width: MediaQuery
            .of(context)
            .size
            .width / 2 - 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.search, color: Colors.blueGrey[600],),
            Icon(Icons.shopping_basket, color: Colors.blueGrey[600],)
          ],
        ),
      )
      ],
    ),)
    ,
    );
  }
}
