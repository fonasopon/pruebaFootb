import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/team_model.dart';
import 'detail_screen.dart';
import 'home_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  var database;

  List<Team> teams = List<Team>();
  
  Future initDb() async{
    database = openDatabase(
    join(await getDatabasesPath(), 'fav_team.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE teams(idTeam TEXT PRIMARY KEY, strTeamBadge TEXT, strTeam TEXT, intFormedYear TEXT, strStadium TEXT, strDescriptionEN TEXT)",
      );
    },
    version: 1,
    );

    getTeams().then((value){
      setState(() {
        teams = value;
      });
    });
  }

  Future<List<Team>> getTeams() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('teams');

    return List.generate(maps.length, (i) {
      return Team(
        idTeam : maps[i]['idTeam'],
        strTeamBadge : maps[i]['strTeamBadge'],
        strTeam : maps[i]['strTeam'],
        intFormedYear : maps[i]['intFormedYear'],
        strStadium : maps[i]['strStadium'],
        strDescriptionEN : maps[i]['strDescriptionEN'],
      );
    });

    //prin
  }

  Future<void> deleteTeam(String idTeam) async {
    final db = await database;
    await db.delete(
      'teams',
      where: "idTeam = ?",
      whereArgs: [idTeam],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Favorite Teams',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.home),
                    iconSize: 26.0,
                    color: Colors.white,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                            HomeScreen()
                            ),
                          ),
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),

                  
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: teams.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                    DetailScreen(teams[index])
                                    ),
                                  );
                          },
                            child: Container(
                            margin: EdgeInsets.all(6.0),
                              height: 70.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 2.0
                                  ),
                                ], 
                              ),
                              child: ListTile(
                              leading: Image.network(teams[index].strTeamBadge),
                              title: Text(teams[index].strTeam, 
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(teams[index].strStadium),
                              trailing: IconButton(
                                icon: Icon(FontAwesomeIcons.trashAlt),
                                color: Colors.grey,
                                iconSize: 22.0,
                                onPressed: () {
                                  deleteTeam(teams[index].idTeam).then((value){
                                    getTeams().then((value){
                                      setState(() {
                                        teams = value;
                                      });
                                    });
                                  });
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Remove from Favorite"),
                                  ));
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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