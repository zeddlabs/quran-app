class City {
  String id;
  String city;

  City({
    required this.id,
    required this.city,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(id: json['id'], city: json['lokasi']);
  }
}
