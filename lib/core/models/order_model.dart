import 'dart:convert';

import 'package:gear_care/core/models/user_model.dart';

class OrderModel {
  final String? orderId;
  final String? carType;
  final String? location;
  final String? problemDescription;
  final String? clientId;
  final String? serviceProviderId;
  final String? date;
  final String? status;
  final String? clientName;
  final String? clientImage;
  final String? clientPhone;

  OrderModel({
    this.orderId,
    this.carType,
    this.location,
    this.problemDescription,
    this.clientId,
    this.serviceProviderId,
    this.date,
    this.status,
    this.clientName,
    this.clientImage,
    this.clientPhone,
  });

  factory OrderModel.fromMap(Map<String, dynamic> data) => OrderModel(
        orderId: data['orderId'] as String?,
        carType: data['carType'] as String?,
        location: data['location'] as String?,
        problemDescription: data['problemDescription'] as String?,
        clientId: data['clientId'] as String?,
        serviceProviderId: data['serviceProviderId'] as String?,
        date: data['date'] as String?,
        status: data['status'] as String?,
        // will be modified later
        clientImage: data['clientPhoto'] as String?,
        clientName: data['clientName'] as String?,
        clientPhone: data['phoneNumber'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'orderId': orderId,
        'cartype': carType,
        'location': location,
        'ProblemDescription': problemDescription,
        'clientId': clientId,
        'ServiceProvierId': serviceProviderId,
        'date': date,
        'status': status,
        // will be modified later
        'clientPhoto': clientImage,
        'clientName': clientName,
        'phoneNumber': clientPhone,
      };

  factory OrderModel.fromJson(String data) {
    return OrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}