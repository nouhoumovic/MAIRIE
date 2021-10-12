import 'package:bhs/models/user_modal.dart';
import 'package:bhs/views/user/demande_encour_view.dart';
import 'package:bhs/views/user/demande_traite_view.dart';
import 'package:flutter/material.dart';

class Demande extends StatefulWidget {
  static String rootName = "/demande";
  final User user;
  const Demande({Key key, this.user}) : super(key: key);

  @override
  _DemandeState createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des demandes"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: new BoxDecoration(color: Colors.cyan[100]),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DemandeEnCours(user: widget.user),
                  ),
                );
              },
              leading: Icon(Icons.hourglass_top_rounded, size: 35),
              title: Text(
                'Demandes en cours',
                style: TextStyle(fontSize: 28.0),
              ),
              trailing: Icon(Icons.keyboard_arrow_right, size: 22),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: new BoxDecoration(color: Colors.indigo[100]),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DemandeTraite(
                      user: widget.user,
                    ),
                  ),
                );
              },
              leading: Icon(Icons.hourglass_bottom_rounded, size: 35),
              title: Text(
                'Demandes traitées',
                style: TextStyle(fontSize: 28.0),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
