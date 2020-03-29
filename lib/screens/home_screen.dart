import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/team_list.dart';
import 'favorite_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int curentTab = 0;
  int selectedIndex = 0;
  String idLeague = "4328";

  List<IconData> icons = [
    FontAwesomeIcons.iceCream,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.plane,
    FontAwesomeIcons.mugHot
  ];

  List<String> league = ["English Premiere League", "German Bundesliga", "Italian Serie A", "Spanish La Liga"];

  Widget listIcon(int index){
    // return GestureDetector(
    //   onTap: () {
    //     setState(() {
    //       selectedIndex = index;
    //       if(index == 0){
    //         idLeague = "4328";
    //       }else if(index == 1){
    //         idLeague = "4329";
    //       }
    //       else if(index == 2){
    //         idLeague = "4335";
    //       }
    //       else{
    //         idLeague = "4331";
    //       }
    //     });
    //   },
    //   child: Container(
    //     height: 50.0,
    //     width: 50.0,
    //     decoration: BoxDecoration(
    //       color: selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFE7EBEE),
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     child: Icon(
    //       icons[index],
    //       color:  selectedIndex == index ?  Theme.of(context).accentColor: Color(0xFFB4C1C4),
    //       ),
    //     ),
    // );

    // return ListView.builder(
    //         scrollDirection: Axis.horizontal,
    //         itemCount: league.length,
    //         itemBuilder: (BuildContext context, int index){
    //           return GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 selectedIndex = index;
    //                 if(index == 0){
    //                   idLeague = "4328";
    //                 }else if(index == 1){
    //                   idLeague = "4329";
    //                 }
    //                 else if(index == 2){
    //                   idLeague = "4335";
    //                 }
    //                 else{
    //                   idLeague = "4331";
    //                 }
    //               });
    //             },
    //               child: Container(
    //               margin: EdgeInsets.all(6.0),
    //               width: 280.0,
    //               decoration: BoxDecoration(
    //                 color: Theme.of(context).primaryColor,
    //                 borderRadius: BorderRadius.circular(10.0),
    //               ),
    //             ),
    //           );
    //         },
    //       );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      
      // appBar: AppBar(
      //   title: Text("Haha"),

      //   // actions: <Widget>[
      //   //   IconButton(
      //   //     icon: Icon(Icons.stars),
      //   //     iconSize: 24.0,
      //   //     color: Colors.white,
      //   //     onPressed: (){},
      //   //   )
      //   // ],
      // ),

      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Football Apps',
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.star),
                    iconSize: 25.0,
                    color: Colors.white,
                    onPressed: () => {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                            FavoriteScreen()
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
                
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: <Widget>[

                            Container(
                              height: 40.0,
                              //color: Theme.of(context).primaryColor,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: league.length,
                                itemBuilder: (BuildContext context, int index){
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                        if(index == 0){
                                          idLeague = "4328";
                                        }else if(index == 1){
                                          idLeague = "4331";
                                        }
                                        else if(index == 2){
                                          idLeague = "4332";
                                        }
                                        else{
                                          idLeague = "4335";
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 150.0,
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          color: selectedIndex == index ? Theme.of(context).primaryColor : Color(0xFFFFFFFF),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              league[index],
                                              style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                              color:  selectedIndex == index ?  Theme.of(context).accentColor: Color(0xFFB4C1C4),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              ),
                            ),

                            //listLeague(0)
                          ],
                        ),
                      ),

                      TeamList(idLeague),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),


      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color(0xFFF0F4F1),
      //   currentIndex: curentTab,
      //   onTap: (int value){
      //     setState(() {
      //       curentTab = value;
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         FontAwesomeIcons.home,
      //         size: 22.0,
      //       ),
      //       title: SizedBox.shrink()
      //       // title: Text("Home",
      //       //   style: TextStyle(
      //       //     fontSize: 18.0,
      //       //     fontWeight: FontWeight.w500,
      //       //   ),
      //       // ),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         FontAwesomeIcons.star,
      //         size: 22.0,
      //       ),
      //       title: SizedBox.shrink(),
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: CircleAvatar(
      //     //     radius: 13.0,
      //     //     backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
      //     //   ),
      //     //   title: SizedBox.shrink(),
      //     // ),
      //   ],
      // )


    );
  }
}