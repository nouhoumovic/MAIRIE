import 'package:bhs/models/user_modal.dart';
import 'package:bhs/views/menu_user_view.dart';
import 'package:flutter/material.dart';

class HomeViewScreen extends StatefulWidget {
  static String rootName = "/home";
  final User user;
  const HomeViewScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OGII"),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.green[100],
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Menu(user: widget.user),
                    ),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.account_balance,
                        size: 90.0,
                        color: Colors.blue,
                      ),
                      Text(
                        "Mairie",
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            MyMenu(
              title: "Police",
              icon: Icons.policy,
              warna: Colors.indigo,
            ),
            MyMenu(
              title: "ONT",
              icon: Icons.car_rental,
              warna: Colors.green,
            ),
            MyMenu(
              title: "Justice",
              icon: Icons.contact_mail_rounded,
              warna: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.icon, this.warna});
  final String title;
  final IconData icon;
  final MaterialColor warna;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {},
          splashColor: Colors.green,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 90.0,
                  color: warna,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 20.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
