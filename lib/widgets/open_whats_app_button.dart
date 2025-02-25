import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String phoneNumber) async {
  final Uri whatsappUrl = Uri.parse("https://wa.me/$phoneNumber");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch $whatsappUrl');
  }
}