import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 =
      new Items(title: "Restaurantes", img: "assets/restaurantes.png");

  Items item2 = new Items(title: "Mercados", img: "assets/food.png");

  Items item3 = new Items(title: "Bebidas", img: "assets/drinks.png");

  Items item4 = new Items(title: "Farmacias", img: "assets/farmacias.png");
  Items item5 = new Items(title: "Ubicaciones", img: "assets/map.png");

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5];
    var color = 0xffffffff;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                color: Color(color),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title, this.img});
}
