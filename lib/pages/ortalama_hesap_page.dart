import 'package:dinamik_not_ortalama/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaHesapApp extends StatefulWidget{
  const OrtalamaHesapApp({super.key});

  @override
  State<OrtalamaHesapApp> createState() => _OrtalamaHesapAppState();
}

class _OrtalamaHesapAppState extends State<OrtalamaHesapApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(AppSabitleri.baslik, style: AppSabitleri.textStyle))
      ),
      body: Center(
        child: Text("Merhaba"),
      ),
    );
  }
}