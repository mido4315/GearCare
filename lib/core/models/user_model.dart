import 'dart:convert';
import 'dart:io';

class UserModel {
  final String? name;
  final String? phoneNumber;
  final String? email;
  final String? location;
  final String? username;
  final String? password;
  final String? userType;
  final String? token;
  final File? photo;
  final String? photoId;
  final String? latitude;
  final String? longitude;

  UserModel({
    this.name,
    this.phoneNumber,
    this.email,
    this.location,
    this.username,
    this.password,
    this.userType,
    this.token,
    this.photo,
    this.photoId,
    this.latitude,
    this.longitude,
  });

  // factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
  //       name: data['name'] as String?,
  //       phoneNumber: data['phoneNumber'] as String?,
  //       email: data['email'] as String?,
  //       location: data['location'] as String?,
  //       photoId: data['photoId'] as String?,
  //       username: data['userName'] as String,
  //       password: data['password'] as String,
  //       userType: data['roles'][0] as String?,
  //       token: data['token'] as String?,
  //     );

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        name: data['user']['name'] as String?,
        email: data['user']['email'] as String?,
        location: data['user']['location'] as String?,
        username: data['user']['username'] as String?,
        phoneNumber: data['user']['phoneNumber'] as String?,
        userType: data['user']['userType'] as String?,
        photoId: data['user']['photoId'] as String?,
        token: data['token'] as String?,
        latitude: data['latitude'] as String?,
        longitude: data['longitude'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'email': email,
        'location': location,
        'username': username,
        'password': password,
        'userType': userType,
        'token': token,
        'photoId': photoId,
        'latitude': latitude,
        'longitude': longitude,
      };

  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

// UserModel copyWith({
//   String? name,
//   String? phoneNumber,
//   String? email,
//   String? location,
//   String? photoId,
//   String? username,
//   String? password,
//   String? userType,
//   String? token,
//
// }) {
//   return UserModel(
//     name: name ?? this.name,
//     phoneNumber: phoneNumber ?? this.phoneNumber,
//     email: email ?? this.email,
//     location: location ?? this.location,
//     photoId: photoId ?? this.photoId,
//     username: username ?? this.username,
//     password: password ?? this.password,
//     userType: userType ?? this.userType,
//     token: token ?? this.token,
//   );
// }
}