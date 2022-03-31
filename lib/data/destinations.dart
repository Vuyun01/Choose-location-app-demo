
class Destination{
  String name;
  String location;
  String description;
  String image;
  bool isChose;

  Destination({
    required this.name, 
    required this.location, 
    required this.description, 
    required this.image,
    this.isChose = false
  });
}