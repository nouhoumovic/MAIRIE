import 'package:bhs/models/user_modal.dart';
import 'package:bhs/views/admin/deamnde_encours_admin_view.dart';
import 'package:bhs/views/admin/demande_tratite_admin_view.dart';
import 'package:bhs/views/admin/list_user.dart';
import 'package:bhs/views/user/demande_traite_view.dart';
import 'package:bhs/views/user/profil_view.dart';
import 'package:flutter/material.dart';

class DashboardAdmin extends StatefulWidget {
  static String rootName = "/dashboardAdmin";
  final User user;
  const DashboardAdmin({Key key, this.user}) : super(key: key);

  @override
  _DashboardAdminState createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("DashBoard : Demandes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.yellow,
              size: 30.8,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              color: Colors.grey[50],
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DemandeEncoursAdmin(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.hourglass_top_outlined,
                        size: 70,
                        color: Colors.indigo,
                      ),
                      Text(
                        "En cours",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.grey[50],
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DemandeTraiteAdmin(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.hourglass_bottom_outlined,
                        size: 70,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        "Traité",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.grey[50],
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ListUserView(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.deepOrangeAccent,
                      ),
                      Text(
                        "Users",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.grey[50],
              margin: EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profil(
                        user: widget.user,
                      ),
                    ),
                  );
                },
                splashColor: Colors.green,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.person_pin_rounded,
                        size: 70,
                        color: Colors.green[600],
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(fontSize: 30.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({this.title, this.number});
  final String title;
  final String number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.green,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                number,
                style: TextStyle(fontSize: 50.0),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
