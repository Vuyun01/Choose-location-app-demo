import 'package:basic_project_1/data/destinations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:basic_project_1/pages/builditem.dart';

class InitLocations extends StatefulWidget {
  const InitLocations({ Key? key }) : super(key: key);
  
  @override
  State<InitLocations> createState() => _InitLocationsState();
}

class _InitLocationsState extends State<InitLocations> {
  final _title = const Text('HOME PAGE');
  final List<Destination> savedDestination = [];
  final List<Destination> listPlaces = [
    Destination(name: 'Mu Cang Chai', location: 'Viet Nam', image:  'vietnam.jpg', 
    description: 'Get off the beaten path in this rural district where the rice '
    'paddy-terraced mountains and twisting streams will make you feel like '
    'you are living in a fairy tale.'),
    Destination(name: 'Polynesia', location: 'France', image:  'french.jpg', description: 'With turquoise lagoons, coral reefs and overwater bungalows, this small island in the South Pacific is basically heaven on Earth.'),
    Destination(name: 'Cherry Blossom Season', location: 'Japan',  image:  'japanblossoms.jpg', description: 'While Japan is beautiful year-round, the few weeks each spring when cherry trees across the country explode with blossoms is a particularly pretty time to visit.'),
    Destination(name: 'Great Ocean Road', location: 'Australia', image:  'aus.jpg', description: 'Head west from Melbourne on this coastal drive to see everything from the famous 12 Apostle rock formations, to koalas in Great Otway National Park as well as the charming seaside town of Lorne.'),
    Destination(name: 'Banff National Park', location: 'Canada', image:  'canadapark.jpg', description: 'The glacial lakes in Canadas first national park have some of the bluest water you have ever seen. Even if you are not particularly outdoorsy, you can still admire the views from one of the cozy and luxurious lakeside lodges throughout the park, like the Fairmont Chateau Lake Louise.'),
    Destination(name: 'Torres del Paine National Park', location: 'Chile', image:  'anh6.jpg', description: 'If you are looking to get off the grid, head to Chiles Patagonia region for some of the most beautiful mountain views you will ever see.'),
    Destination(name: 'Krabi', location: 'Thailand', image:  'thailand.jpg', description: 'Located on southern Thailands west coast, this provinces coastline is dotted with limestone cliffs and hundreds of islands just offshore in the Andaman Sea, making it one of the worlds most popular beach vacation destinations.'),
    Destination(name: 'Fiordland National Park', location: 'New Zealand', image:  'new-zealand.jpg', description: 'Each year starting in the end of November and peaking in early December, fields of bright purple Russell Lupins bloom across New Zealands South Island. One of the most beautiful spots to go Lupin-spotting is in Fiordland National Park, home to the equally gorgeous Milford Sound.'),
    Destination(name: 'Fernando de Noronha', location: 'Brazil', image:  'brazil_1.jpg', description: 'This remote volcanic archipelago (located about 200 miles off Brazils coast) is famous for pristine white-sand beaches and crystal-clear waters filled with sea turtles and dolphins.'),
    Destination(name: 'Zlatni Rat', location: 'Croatia', image:  'croatia.jpg', description: 'Located on the Croatian Island of Brač, the Golden Cape is one of Europe’s top beaches. With crystal blue waters and a white pebble beach, the Golden Cape is the perfect place to take in the sun and let the air flow (some parts of the beach are clothing-optional).'),
    Destination(name: 'Lofoten Islands', location: 'Norway', image:  'norway.jpg', description: 'If you’re looking for the perfect mix of winter and spring then you need to check out the Logoten Islands. Technically located in the Arctic, it contains some of the warmest temperatures due to an elevation anomaly. It’s also a great place to watch the Northern Lights in the winter season.'),
    Destination(name: 'Miho no Matsubara', location: 'Japan', image:  'japan2.jpg', description: 'Known as a place of beauty since the 1920’s, Miho no Matsubara is popularly known for its majestic pine trees. What most people fail to realize is that its black sand beaches are just as magnificent.'),
    Destination(name: 'Iguazú Falls', location: 'Argentina', image:  'argentina.jpg', description: 'The Iguazú Falls are the largest waterfall systems in the world. Located on the borders of Argentina and Brazil, legend has it that a powerful deity was rejected by his mortal lover and in a rage sliced the rivers thus creating the waterfalls.'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurple.shade300,
              Colors.cyan.shade200,
              Colors.purple.shade300
            ]
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black54,
              elevation: 0,
              expandedHeight: 250,
              pinned: true,
              leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed('/favorite', arguments: savedDestination);
                }, 
                icon: Icon(Icons.bookmark_add, color: Colors.white, size: 30,)
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Choose a location'),
                centerTitle: true,
                background: Image.asset('assets/anh3.jpg', fit: BoxFit.cover),
              ),
            ),
            
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                // mainAxisSpacing: 5.0,
                // crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => MyItemPlace(
                  location: listPlaces[index], 
                  isAdded: savedDestination),
                childCount: listPlaces.length,
              ),
            )

          ],
        ),
      )
      
    );
  }
}

