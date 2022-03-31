import 'package:flutter/material.dart';
import 'package:basic_project_1/data/destinations.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

class MyFavoriteItem extends StatelessWidget {
  const MyFavoriteItem({ 
    Key? key,
    required this.location
  }) : super(key: key);
  final Destination location;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/${location.image}'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        dense: true,
        title: Text('${location.name}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text('${location.location}', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic)),
        onTap: (){
          Navigator.pushNamed(context, '/location', arguments: location
            // {
            //   'name' : widget.location.name,
            //   'location' : widget.location.location,
            //   'description' : widget.location.description,
            //   'image' : widget.location.image,
            //   'isChose' : widget.location.isChose 
            // }
          );
        },
        
      ),
    );
  }
}