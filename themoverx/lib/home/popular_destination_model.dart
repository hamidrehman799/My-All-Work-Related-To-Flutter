class PopularDestinationModel {
  String country;
  String image;

  PopularDestinationModel(this.country, this.image);
}

List<PopularDestinationModel> populars = popularsData
    .map((item) => PopularDestinationModel(item['country'], item['image']))
    .toList();

var popularsData = [
  {"country": "karchi", "image": "assets/images/destination_bali.png"},
  {"country": "islamabad", "image": "assets/images/destination_paris.png"},
  {"country": "Lahore", "image": "assets/images/destination_rome.png"},
  {"country": "Faislabad", "image": "assets/images/destination_bali.png"},
  {"country": "Multan", "image": "assets/images/destination_paris.png"},
  {"country": "Sargodha", "image": "assets/images/destination_rome.png"},
];
