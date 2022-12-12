import 'dart:convert';

class UsersDto {
  UsersDto({required this.list});

  List<UserDto> list;

  factory UsersDto.fromJson(String str) => UsersDto.fromDecoded(json.decode(str));

  factory UsersDto.fromDecoded(dynamic decoded) {
    if (decoded is List) {
      return UsersDto(list: List<UserDto>.from(decoded.map((x) => UserDto.fromMap(x))));
    } else {
      return UsersDto(list: [UserDto.fromMap(decoded)]);
    }
  }
}

class UserDto {
  UserDto({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  AddressDto address;
  String phone;
  String website;
  CompanyDto company;

  factory UserDto.fromJson(String str) => UserDto.fromMap(json.decode(str));

  factory UserDto.fromMap(Map<String, dynamic> json) => UserDto(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: AddressDto.fromMap(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: CompanyDto.fromMap(json["company"]),
      );
}

class AddressDto {
  AddressDto({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  GeoDto geo;

  factory AddressDto.fromJson(String str) => AddressDto.fromMap(json.decode(str));

  factory AddressDto.fromMap(Map<String, dynamic> json) => AddressDto(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: GeoDto.fromMap(json["geo"]),
      );
}

class GeoDto {
  GeoDto({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory GeoDto.fromJson(String str) => GeoDto.fromMap(json.decode(str));

  factory GeoDto.fromMap(Map<String, dynamic> json) => GeoDto(
        lat: json["lat"],
        lng: json["lng"],
      );
}

class CompanyDto {
  CompanyDto({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory CompanyDto.fromJson(String str) => CompanyDto.fromMap(json.decode(str));

  factory CompanyDto.fromMap(Map<String, dynamic> json) => CompanyDto(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );
}
