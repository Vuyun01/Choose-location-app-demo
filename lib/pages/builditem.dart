import 'package:flutter/material.dart';
import 'package:basic_project_1/data/destinations.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

class MyItemPlace extends StatefulWidget {
  const MyItemPlace({
    Key? key,
    required this.location,
    required this.isAdded
  }) : super(key: key);

  final Destination location;
  final List<Destination> isAdded;
  @override
  State<MyItemPlace> createState() => _MyItemPlaceState();
}

class _MyItemPlaceState extends State<MyItemPlace> {

  // bool isSelected = false;
  
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.isAdded.contains(widget.location);
    final Size size = MediaQuery.of(context).size;

    // GradientText textGradient(String text,Color firstColor, Color secondColor) => GradientText(
    //   text,
    //   colors: [
    //     firstColor,
    //     secondColor,
    //   ]
    // );
    
    return Container(
      // height: 100,
      width: size.width / 2,
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/${widget.location.image}'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        dense: true,
        title: Text('${widget.location.location}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        // subtitle: Text('${widget.location.location}', style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic)),
        trailing: IconButton(
          onPressed: (){
            setState(() {
              if(isSelected){
                widget.location.isChose = false;
                widget.isAdded.remove(widget.location);
              }else{
                widget.location.isChose = true;
                widget.isAdded.add(widget.location);

              }
            });
          },
          icon: isSelected 
            ? Icon(Icons.favorite, color: Colors.white,) 
            : Icon(Icons.favorite_border, color: Colors.white,)
        ),
        onTap: (){
          Navigator.pushNamed(context, '/location', arguments: 
          widget.location
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


