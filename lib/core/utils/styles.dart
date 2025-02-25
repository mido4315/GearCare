import 'package:flutter/material.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  //13
  static var textStyle13 = GoogleFonts.akshar(
      fontWeight: FontWeight.w400,
      color: AppColors.kPrimaryColor,
      fontSize: 12);
  //14
  static var textStyle14 = GoogleFonts.akshar(
      fontWeight: FontWeight.w500,
      color: AppColors.kPrimaryColor,
      fontSize: 14);
  //15
  static var textStyle15 = GoogleFonts.akshar(
      fontWeight: FontWeight.w200,
      color: AppColors.kPrimaryColor,
      fontSize: 15);
  //16
  static var textStyle16 = GoogleFonts.akshar(
      fontWeight: FontWeight.w500,
      color: AppColors.kPrimaryColor,
      fontSize: 16);
  static var textStyle16Alegreya = GoogleFonts.alegreya(
      fontWeight: FontWeight.w400,
      color: Colors.black.withOpacity(.65),
      fontSize: 16);
  //18
  static var textStyle18 = GoogleFonts.akshar(
      fontWeight: FontWeight.normal,
      color: AppColors.kPrimaryColor,
      fontSize: 18);
  static var textStyle18Alata = GoogleFonts.alata(
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontSize: 18);
  //20
  static var textStyle20 = GoogleFonts.akshar(
      fontWeight: FontWeight.w500,
      color: AppColors.kPrimaryColor,
      fontSize: 20);
  //24
  static var textStyle24 =
      GoogleFonts.akshar(color: Colors.black.withOpacity(.25), fontSize: 24);
      static var textStyle24Bold =
      GoogleFonts.akshar(color: Colors.black.withOpacity(.25), fontSize: 24,fontWeight: FontWeight.w600);

  static var textStyle24Alegreya = GoogleFonts.alegreya(
      color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400);
  //26
  static var textStyle26 = GoogleFonts.akshar(
      fontWeight: FontWeight.w700,
      color: AppColors.kPrimaryColor,
      fontSize: 26);
  //26normal
  static var textStyle26normal = GoogleFonts.akshar(
      fontWeight: FontWeight.w400,
      color: AppColors.kPrimaryColor,
      fontSize: 26);
  static var textStyle28 = GoogleFonts.akshar(
      fontWeight: FontWeight.w400, color: Colors.white, fontSize: 28);
}
