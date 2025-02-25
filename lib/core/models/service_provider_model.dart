import 'dart:convert';

class ServiceProviderModel {
  final String? id;
  final String? name;
  final String? number;
  final String? email;
  final String? location;
  final String? photoId;
  final double? rate;
  final List<String>? specialization;
  final String? carTypeToRepair;
  final bool? available;
  final String? userType;
  final String? latitude;
  final String? longitude;
  ServiceProviderModel({
    this.id,
    this.name,
    this.number,
    this.email,
    this.location,
    this.photoId,
    this.rate,
    this.specialization,
    this.carTypeToRepair,
    this.available,
    this.userType,
    this.latitude,
    this.longitude,
  });

  factory ServiceProviderModel.fromMap(Map<String, dynamic> data) => ServiceProviderModel(
    id:  data['id'] as String?,
    name: data['name'] as String?,
    number: data['number'] as String?,
    email: data['eMail'] as String?,
    location: data['location'] as String?,
    photoId: data['photoId'] as String?,
    rate: (data['rate'] as num?)?.toDouble(),
    specialization: (data['spezilization'] as List<dynamic>?)?.map((e) => e as String).toList(),
    carTypeToRepair: data['carTypeToRepaire'] as String?,
    available: data['available'] as bool?,
    userType: data['userType'] as String?,
    latitude: data['latitude'] as String?,
    longitude: data['longitude'] as String?,
  );

  Map<String, dynamic> toMap() => {
    'id':id,
    'name': name,
    'number': number,
    'eMail': email,
    'location': location,
    'photoId': photoId,
    'rate': rate,
    'spezilization': specialization,
    'carTypeToRepaire': carTypeToRepair,
    'available': available,
    'userType': userType,
    'latitude': latitude,
    'longitude': longitude,
  };

  factory ServiceProviderModel.fromJson(String data) {
    return ServiceProviderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  // ServiceProviderModel copyWith({
  //   String? name,
  //   String? number,
  //   String? email,
  //   String? location,
  //   String? photoId,
  //   double? rate,
  //   List<String>? specialization,
  //   String? carTypeToRepair,
  //   bool? available,
  //   String? userType,
  // }) {
  //   return ServiceProviderModel(
  //     name: name ?? this.name,
  //     number: number ?? this.number,
  //     email: email ?? this.email,
  //     location: location ?? this.location,
  //     photoId: photoId ?? this.photoId,
  //     rate: rate ?? this.rate,
  //     specialization: specialization ?? this.specialization,
  //     carTypeToRepair: carTypeToRepair ?? this.carTypeToRepair,
  //     available: available ?? this.available,
  //     userType: userType ?? this.userType,
  //   );
  // }
}