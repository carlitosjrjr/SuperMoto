import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'griddashboard.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class PrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super Moto',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FoldableSidebarBuilder(
          drawerBackgroundColor: Colors.blue,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: FirstScreen(),
          status: drawerStatus,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF2d4e9f),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                        ? FSBStatus.FSB_CLOSE
                        : FSBStatus.FSB_OPEN;
                  });
                },
              );
            },
          ),
          centerTitle: true,
          title: Text('Super Moto', style: TextStyle(color: Colors.white)),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  FlutterOpenWhatsapp.sendSingleMessage("+591 77445566",
                      "Cuentanos cual es el problema o la consulta que tienes");
                },
                padding: EdgeInsets.all(0.0),
                child: Image.asset(
                  "assets/logo/logo.png",
                  height: 40,
                  width: 40,
                ))
          ],
        ));
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.blueGrey,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("User Name")
                ],
              )),
          ListTile(
            onTap: () {
              debugPrint("Tapped Home");
            },
            leading: Icon(Icons.home),
            title: Text(
              "Inicio",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Profile");
            },
            leading: Icon(Icons.person),
            title: Text(
              "Mi Perfil",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped settings");
            },
            leading: Icon(Icons.settings),
            title: Text("Configuración"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              debugPrint("Tapped Log Out");
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Cerrar Sesión"),
          ),
        ],
      ),
    );
  }
}
