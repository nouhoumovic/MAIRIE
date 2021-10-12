import 'package:bhs/models/acte_model.dart';
import 'package:bhs/models/user_modal.dart';
import 'package:bhs/providers/acte_provider.dart';
import 'package:bhs/views/loading/loading.dart';
import 'package:bhs/views/user/detail_demande_encours.dart';
import 'package:bhs/views/user/details_demande_traite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemandeTraite extends StatefulWidget {
  static String rootName = "/demande_traite";
  final User user;

  DemandeTraite({Key key, this.user}) : super(key: key);

  @override
  _DemandeTraiteState createState() => _DemandeTraiteState();
}

class _DemandeTraiteState extends State<DemandeTraite> {
  ListActe listActes = ListActe();
  User user;

  void initState() {
    listActes.data = <Acte>[];
    super.initState();
  }

  Future<List<Acte>> getActeTraiteByUserId(int id) async {
    var data = await Provider.of<ActeApiProvider>(context, listen: false)
        .GetActeTraiteByUserId(id);
    listActes = data;
    return data.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demande Traité"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<Acte>> listActes) {
        if (!listActes.hasData) {
          return Container(
            child: Center(child: Loading()),
          );
        }
        return ListView.builder(
          itemCount: listActes.data.length,
          itemBuilder: (context, index) {
            return getCard(listActes.data[index]);
          },
        );
      },
      future: getActeTraiteByUserId(widget.user.id),
    );
  }

  Widget getCard(Acte acte) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DetailDemandeTraites(
              user: user,
              acte: acte,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        elevation: 10,
        child: Row(
          children: [
            Image.asset(
              "assets/logo.jpg",
              width: 100,
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Acte N*ML00${acte.id}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${acte.user?.firstName}  ${acte.user?.lastName}",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Traité avec succès",
                    style: TextStyle(fontSize: 18.0, color: Colors.lightGreen),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
