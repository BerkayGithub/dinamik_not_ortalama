import 'package:dinamik_not_ortalama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget{
  final double ortalama;
  final int dersSayisi;

  const OrtalamaGoster({super.key, required this.ortalama, required this.dersSayisi});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dersSayisi > 0 ? '$dersSayisi Ders girildi' : 'Ders giriniz', style: AppSabitleri.dersSayisiStyle),
        Text(ortalama.toStringAsFixed(2), style: AppSabitleri.ortalamaStyle),
        Text("Ortalama", style: AppSabitleri.ortalamaTextStyle),
      ],
    );
  }

}