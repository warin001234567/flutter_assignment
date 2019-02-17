import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> 
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text("Home"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          ),

          bottomNavigationBar: Container(
            color: Colors.blue,
            child: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
              Tab(
                icon: Icon(Icons.notifications)
              ),
              Tab(
                icon: Icon(Icons.explore),
              ),
              Tab(
                icon: Icon(Icons.person),
                ),
              Tab(
                icon: Icon(Icons.settings)
                ,)


            ],
            ),
            
          ),
          body: TabBarView(
            children: <Widget>[
              Center(child: Text("Home", style: TextStyle(fontSize: 36, color: Colors.grey),),),
              Center(child: Text("Notify", style: TextStyle(fontSize: 36, color: Colors.grey),),),
              Center(child: Text("Map", style: TextStyle(fontSize: 36, color: Colors.grey),),),
              Center(child: Text("Profile", style: TextStyle(fontSize: 36, color: Colors.grey),),),
              Center(child: Text("Setup", style: TextStyle(fontSize: 36, color: Colors.grey),),),
            ],
          ),
      ),
    );
  }
}