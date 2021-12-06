class bottom2 {
  String country;
  String image;

  bottom2(this.country, this.image);
}

List<bottom2> populars = popularsData
    .map((item) => bottom2(item['country'], item['image']))
    .toList();

var popularsData = [
  {"country": "E MINI", "image": "assets/images/Emini.png"},
  {"country": "E GO", "image": "assets/images/EGo.png"},
  {"country": "E Exective", "image": "assets/images/executive.png"},
  {"country": "A Auto", "image": "assets/images/eauto.png"},
  {"country": "E Bike", "image": "assets/images/ebike.png"},
  {"country": "City To city", "image": "assets/images/city_to_city.png"},
];
