class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "assets/images/banner.png"},
  {"image": "assets/images/banner2.jpg"},
  {"image": "assets/images/s2.gif"},
];
