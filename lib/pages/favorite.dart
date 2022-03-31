// import 'package:basic_project_1/pages/builditem.dart';
import 'package:basic_project_1/pages/builditemfavorite.dart';
import 'package:flutter/material.dart';
import 'package:basic_project_1/data/destinations.dart';

class Favorite extends StatefulWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}
class _FavoriteState extends State<Favorite> {
  final String titleFav = 'Favorite Tab';
  List<Destination> listdata = [];

  
  @override
  Widget build(BuildContext context) {
    listdata = ModalRoute.of(context)!.settings.arguments as List<Destination>;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyan.shade200,
              Colors.deepPurple.shade300
            ]
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black54,
              elevation: 0,
              expandedHeight: 200,
              pinned: true,
              
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                title: Text('Favorite Tab'),
                centerTitle: true,
                stretchModes: [
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                  StretchMode.zoomBackground
                ],
                background: Image.asset('assets/anh5.jpg', fit: BoxFit.cover),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => MyFavoriteItem(location: listdata[index]),
                childCount: listdata.length
              )
            )
          ],
        ),
      )
    );
  }
}


