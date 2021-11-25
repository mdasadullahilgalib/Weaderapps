import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:frontendtminiproject/page1.dart';
import 'package:frontendtminiproject/page2.dart';
import 'package:frontendtminiproject/page3.dart';
import 'package:frontendtminiproject/page4.dart';
import 'package:frontendtminiproject/page5.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {

  var CurrentIndex =0;
  List listofContainers =[
    page1(),
    page2(),
    page3(),
    page4(),
    page5(),
  ];
  Future<bool> _onWillPop() async{
    return (await showDialog(context: context,
        builder: (context) =>
    new AlertDialog(
      title: new Text('Are you sure'),
      content: new Text('Do you want to exit an App'),
      actions: <Widget>[
        TextButton(onPressed: ()=> Navigator.of(context).pop(false),
        child: new Text('No',
        style: TextStyle(color: Colors.green[800]),
        ),
        ),
        TextButton(onPressed: ()=> Navigator.of(context).pop(false),
          child: new Text('Yes',
            style: TextStyle(color: Colors.green[800]),
          ),
        ),
      ],
    ),
    )) ?? false;
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: listofContainers[CurrentIndex] ,

        bottomNavigationBar: BottomNavyBar(
            items: <BottomNavyBarItem>[

              BottomNavyBarItem(icon: Icon(Icons.home),
                  title: Text("Home"),
                activeColor: Colors.orange,
                inactiveColor: Colors.black12
              ),
              BottomNavyBarItem(icon: Icon(Icons.apps_outlined),
                  title: Text("Desboard"),
                  activeColor: Colors.orange,
                  inactiveColor: Colors.black12
              ),
              BottomNavyBarItem(icon: Icon(Icons.account_box_sharp),
                  title: Text("Profile"),
                  activeColor: Colors.orange,
                  inactiveColor: Colors.black12
              ),
              BottomNavyBarItem(icon: Icon(Icons.add_call),
                  title: Text("add"),
                  activeColor: Colors.orange,
                  inactiveColor: Colors.black12
              ),
              BottomNavyBarItem(icon: Icon(Icons.add_alert),
                  title: Text("Notifiacation"),
                  activeColor: Colors.orange,
                  inactiveColor: Colors.black12
              ),

            ],
            selectedIndex: CurrentIndex,
            onItemSelected: (index){
              setState(() {
                CurrentIndex =index;
              });
            } ),

      ),
    );
  }
}
