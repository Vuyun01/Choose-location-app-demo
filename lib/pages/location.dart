import 'package:flutter/material.dart';
import 'package:basic_project_1/data/destinations.dart';

class Locations extends StatefulWidget {
  const Locations({ Key? key }) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  Destination? data;
  final int _counter = 24;
  final Color whiteColor = Colors.white;
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // Color colors = Theme.of(context).primaryColor;
    // Map data = ModalRoute.of(context)!.settings.arguments as Map;
    data = ModalRoute.of(context)!.settings.arguments as Destination;
    _isFavorite = data!.isChose;
    

    //widgets
    Widget imageBg = Container(
      height: 280,
      width: 600,
      child: Image(
        image: AssetImage('assets/${data!.image}'),
        fit: BoxFit.fill,
      ),
    );

    Widget titleSection = Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Text('${data!.name}', style: TextStyle(color: whiteColor,fontWeight: FontWeight.bold),),
                ),
                Text('${data!.location}', style: TextStyle(color: Colors.white60),)
              ],
            ),
          ),
          IconButton(
            onPressed: (){
              // setState(() {
              //   if(_isFavorite){
              //     _isFavorite == false;
              //     _counter -= 1;
              //   }else{
              //     _isFavorite == true;
              //     _counter += 1;
              //   }
              // });
            },
            icon: _isFavorite
            ? Icon(Icons.favorite, color: whiteColor) 
            : Icon(Icons.favorite_border, color: whiteColor)
          ),
          Text('$_counter', style: TextStyle(color: whiteColor)),
        ],
      ),
    );

    Column createButton(String label, IconData icon, Color color){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 3),
            child: IconButton(
              onPressed: (){},
              icon: Icon(icon, color: color,)
            ),
          ),
          Text(label, style: TextStyle(color: color),),
        ],
      );
    }

    Widget columnButtons = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          createButton('CALL', Icons.phone, whiteColor),
          createButton('ROUTE', Icons.near_me, whiteColor),
          createButton('SHARE', Icons.share, whiteColor),
        ],
      ),
    );

    Widget desciptionSection = Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Text(
        '${data!.description}', 
        style: TextStyle(color: whiteColor, fontFamily: 'Roboto'),
      ),
    );

    return Scaffold(
      
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0, right: 0,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/${data!.image}'),
                    fit: BoxFit.cover
                  )
                ),
              )
            ),
            Positioned(
              top: 20, left: 10,
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back, color: Colors.white),
              )
            ),
            Positioned(
              top: 250,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.shade200,
                      Colors.lightBlue.shade300,
                      Colors.cyan.shade200,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.mirror
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  children: [
                    titleSection,
                    columnButtons,
                    desciptionSection,
                  ],
                ),
              )
            ),
          ]
        ),
      ),
    );
  }
}